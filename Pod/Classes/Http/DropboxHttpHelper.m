//
//  DropboxHttpHelper.m
//  Pods
//
//  Created by Михаил Мотыженков on 13.04.16.
//
//

#import "DropboxHttpHelper+PrivateMethods.h"
#import "DropboxErrors.h"

static NSString * const keyErrorMessage = @"error_summary";

@implementation DropboxHttpHelper
{
    NSString * _authorization;
}

+ (NSString * _Nonnull)jsonStringWithDictionary:(NSDictionary * _Nonnull)dic {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:0
                                                         error:&error];
    if (!jsonData)
    {
        NSLog(@"Error: %@", error.localizedDescription);
        return @"{}";
    }
    else
    {
        NSString *result = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        result = [self removeWrongCharactersFromJsonString:result];
        result = [self stringWithUnicharsFromString:result];
        return result;
    }
}

+ (NSString * _Nonnull)stringWithUnicharsFromString:(NSString * _Nonnull)string
{
    NSMutableString *result = [NSMutableString new];
    for (int i = 0; i < string.length; i++)
    {
        NSString *substring = [string substringWithRange:NSMakeRange(i, 1)];
        if ([substring canBeConvertedToEncoding:NSASCIIStringEncoding])
        {
            [result appendString:substring];
        }
        else
        {
            [result appendFormat:@"\\u%04x", [string characterAtIndex:i]];
        }
    }
    return result;
}

+ (NSData * _Nonnull)jsonDataWithDictionary:(NSDictionary * _Nonnull)dic
{
    NSString *string = [self jsonStringWithDictionary:dic];
    NSData *result = [string dataUsingEncoding:NSUTF8StringEncoding];
    return result;
}

+ (NSString * _Nonnull)removeWrongCharactersFromJsonString:(NSString * _Nonnull)string
{
    NSMutableString *result = [[NSMutableString alloc] initWithString:string];
    [result replaceOccurrencesOfString:@"\\/" withString:@"/" options:NSLiteralSearch range:NSMakeRange(0, result.length)];
    return result;
}

+ (void)convertJsonBodyWithData:(NSData * _Nullable)data outputType:(Class)outputType toCompletionBlock:(void(^ _Nullable)(id nonnull))outputBlock withFailBlock:(nullable ErrorBlock)failBlock
{
    if (outputBlock)
    {
        id outputBody;
        if (!data)
        {
            outputBody = [[outputType alloc] init];
        }
        else
        {
            NSError *error;
            outputBody = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            if (error && data.length != 4)
            {
                if (failBlock)
                {
                    failBlock([ObjectiveDropboxError errorWithSummary:@"Can't parse JSON data"]);
                }
                return;
            }
        }
        outputBlock(outputBody);
    }
}

+ (NSURLRequest *)createRequestWithHttpHeaders:(NSDictionary * _Nullable)httpHeaders url:(NSURL * _Nonnull)url content:(NSData * _Nullable)content
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    if (httpHeaders)
    {
        for (NSString *key in httpHeaders)
        {
            [request addValue:httpHeaders[key] forHTTPHeaderField:key];
        }
    }
    request.HTTPMethod = @"POST";
    if (content)
    {
        request.HTTPBody = content;
    }
    return request;
}

- (void)setAccessToken:(NSString *)accessToken
{
    _accessToken = accessToken;
    _authorization = [NSString stringWithFormat:@"Bearer %@", _accessToken];
}

+ (NSURL *)urlWithHost:(NSString *)host path:(NSString *)path method:(NSString *)method
{
    // stringByAppendingPathComponent returns bad result if pathComponent contains '/' character
    NSString *result = [NSString stringWithFormat:@"%@/%@/%@", host, path, method];
    return [NSURL URLWithString:result];
}

- (NSURL *)urlWithRpcMethod:(NSString *)method
{
    NSURL *url = [DropboxHttpHelper urlWithHost:_hostRpc path:_path method:method];
    return url;
}

- (NSURL *)urlWithUploadMethod:(NSString *)method
{
    NSURL *url = [DropboxHttpHelper urlWithHost:_hostUpload path:_path method:method];
    return url;
}

- (NSURL *)urlWithDownloadMethod:(NSString *)method
{
    NSURL *url = [DropboxHttpHelper urlWithHost:_hostDownload path:_path method:method];
    return url;
}

- (NSDictionary *)getRpcHeaders
{
    return @{@"Content-Type": @"application/json",
             @"Authorization": _authorization};
}

- (NSDictionary *)getUploadHeadersWithParams:(NSDictionary *)params
{
    NSString *jsonString = [DropboxHttpHelper jsonStringWithDictionary:params];
    return @{@"Content-Type": @"application/octet-stream",
             @"Authorization": _authorization,
             @"Dropbox-API-Arg": jsonString};
}

- (NSDictionary *)getDownloadHeadersWithParams:(NSDictionary *)params
{
    NSString *jsonString = [DropboxHttpHelper jsonStringWithDictionary:params];
    return @{@"Authorization": _authorization,
             @"Dropbox-API-Arg": jsonString};
}

- (NSData *)convertDictionary:(NSDictionary * _Nonnull)dic toJsonWithFailBlock:(nullable ErrorBlock)failBlock
{
    NSError *error;
    NSData *content = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    if (error)
    {
        if (failBlock)
        {
            failBlock([ObjectiveDropboxError errorWithSummary:@"Can't create JSON from NSDictionary"]);
        }
    }
    return content;
}

- (void)checkParseResult:(id)result success:(void (^ _Nullable)(id result))successBlock fail:(_Nullable ErrorBlock)failBlock
{
    BOOL ok = [self checkParseResult:result fail:failBlock];
    if (successBlock && ok)
    {
        successBlock(result);
    }
}

- (BOOL)checkParseResult:(nullable id)result fail:(_Nullable ErrorBlock)failBlock
{
    if (!result)
    {
        if (failBlock)
        {
            ObjectiveDropboxError *error = [ObjectiveDropboxError errorWithSummary:@"Couldn't parse Dropbox response"];
            failBlock(error);
        }
        return NO;
    }
    else
    {
        return YES;
    }
}

#pragma mark - RPC

- (void)rpcEndpointWithRoute:(NSString * _Nonnull)route params:(NSDictionary * _Nonnull)dic succcessWithRawData:(nullable CompletionBlockWithHeadersAndBody)successBlock fail:(nullable ErrorBlock)failBlock
{
    NSData *content = [DropboxHttpHelper jsonDataWithDictionary:dic];
    NSDictionary *headers = [self getRpcHeaders];
    NSURL *url = [self urlWithRpcMethod:route];
    
    NSURLRequest *request = [DropboxHttpHelper createRequestWithHttpHeaders:headers url:url content:content];
    NSURLSessionDataTask *task = [self.dataSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        NSDictionary *httpHeaders = nil;
        int statusCode = -1;
        if (response)
        {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            statusCode = (int)httpResponse.statusCode;
            httpHeaders = httpResponse.allHeaderFields;
        }
        if (error || statusCode != 200)
        {
            if (failBlock)
            {
                [DropboxHttpHelper handleDropboxRequestErrorWithStatusCode:statusCode outputContent:data outputHeadersDic:httpHeaders errorBlock:failBlock];
            }
            return;
        }
        if (successBlock)
        {
            successBlock(httpHeaders, data);
        }
    }];
    [task resume];
}

- (void)rpcEndpointWithRoute:(NSString *)route param:(id<DictionarySerializer>)arg resultType:(Class<DictionaryParser> _Nullable)resultType success:(void (^)(id<DictionaryParser> _Nullable))successBlock fail:(ErrorBlock)failBlock
{
    [self rpcEndpointWithRoute:route param:arg resultType:resultType parseManager:nil success:successBlock fail:failBlock];
}

- (void)rpcEndpointWithRoute:(NSString *)route param:(id<DictionarySerializer>)arg parseManager:(Class<DictionaryParseManager> _Nullable)parseManager success:(void (^)(id<DictionaryParser> _Nullable))successBlock fail:(ErrorBlock)failBlock
{
    [self rpcEndpointWithRoute:route param:arg resultType:Nil parseManager:parseManager success:successBlock fail:failBlock];
}

- (void)rpcEndpointWithRoute:(NSString *)route param:(id<DictionarySerializer>)arg resultType:(Class<DictionaryParser> _Nullable)resultType parseManager:(Class<DictionaryParseManager> _Nullable)parseManager success:(void (^)(id<DictionaryParser> _Nullable))successBlock fail:(ErrorBlock)failBlock
{
    NSDictionary *dic = arg ? [arg dictionaryFromParams] : @{};
    [self rpcEndpointWithRoute:route params:dic succcessWithRawData:^(NSDictionary * _Nullable headers, NSData * _Nullable data) {
        [DropboxHttpHelper convertJsonBodyWithData:data outputType:[NSDictionary class] toCompletionBlock:^(id _Nonnull output) {
            id result;
            NSDictionary *bodyDic = output;
            if (resultType == Nil && parseManager == Nil)
            {
                if (successBlock)
                {
                    successBlock(nil);
                }
                return;
            }
            else if (resultType != Nil)
            {
                result = [[(Class)resultType alloc] initWithDictionary:bodyDic];
            }
            else if (parseManager != Nil)
            {
                result = [parseManager parseDic:bodyDic];
            }
            [self checkParseResult:result success:successBlock fail:failBlock];
        } withFailBlock:failBlock];
        
    } fail:failBlock];
}

- (void)rpcEndpointWithRoute:(NSString *)route param:(id<DictionarySerializer>)arg resultArrayType:(Class<DictionaryParser>)resultType success:(void (^)(NSArray<DictionaryParser> * _Nullable))successBlock fail:(ErrorBlock)failBlock
{
    NSDictionary *dic = arg ? [arg dictionaryFromParams] : @{};
    [self rpcEndpointWithRoute:route params:dic succcessWithRawData:^(NSDictionary * _Nullable headers, NSData * _Nullable data) {
        [DropboxHttpHelper convertJsonBodyWithData:data outputType:[NSArray class] toCompletionBlock:^(id _Nonnull output) {
            if (resultType == Nil)
            {
                if (successBlock)
                {
                    successBlock(nil);
                }
                return;
            }
            NSArray *outputArray = output;
            NSMutableArray *result = [NSMutableArray new];
            for (NSDictionary *subdic in outputArray)
            {
                if (![subdic isKindOfClass:[NSDictionary class]])
                {
                    if (failBlock)
                    {
                        ObjectiveDropboxError *error = [ObjectiveDropboxError errorWithSummary:@"Couldn't parse array in Dropbox response"];
                        failBlock(error);
                    }
                    return;
                }
                id element = [[(Class)resultType alloc] initWithDictionary:subdic];
                [result addObject:element];
            }
            [self checkParseResult:result success:successBlock fail:failBlock];
        } withFailBlock:failBlock];
    } fail:failBlock];
}

- (void)rpcEndpointWithRoute:(NSString *)route param:(id<DictionarySerializer>)arg success:(void (^)(void))successBlock fail:(ErrorBlock)failBlock
{
    [self rpcEndpointWithRoute:route param:arg resultType:Nil success:^(id<DictionaryParser>  _Nullable result) {
        if (successBlock)
        {
            successBlock();
        }
    } fail:failBlock];
}


#pragma mark - Upload

- (DropboxUploadTask *)contentUploadEndpointWithRoute:(NSString *)route param:(id<DictionarySerializer>)arg fileUrl:(NSURL *)fileUrl resultType:(Class<DictionaryParser> _Nullable)resultType progress:(DownloadTaskProgressHandler)progressBlock success:(void (^)(id<DictionaryParser> _Nullable))successBlock fail:(ErrorBlock)failBlock
{
    NSDictionary *dic = arg ? [arg dictionaryFromParams] : @{};
    NSDictionary *headers = [self getUploadHeadersWithParams:dic];
    NSURL *url = [self urlWithUploadMethod:route];
    NSURLRequest *request = [DropboxHttpHelper createRequestWithHttpHeaders:headers url:url content:nil];
    NSURLSessionUploadTask *task = [self.backgroundSession uploadTaskWithRequest:request fromFile:fileUrl];
    
    DropboxUploadTask *uploadTask = [self.sessionDelegate addUploadTask:task session:self.backgroundSession successHandler:^(NSDictionary *headers, NSData * _Nullable outputData, NSInteger statusCode) {
        [self checkDownloadResultWithStatusCode:statusCode headers:headers outputData:outputData resultType:resultType success:successBlock fail:failBlock];
    } progressHandler:progressBlock failHandler:^(NSString *errorSummary) {
        [DropboxHttpHelper handleErrorSummary:errorSummary withFail:failBlock];
    }];
    [task resume];
    return uploadTask;
}

#pragma mark - Download

- (void)checkDownloadResultWithStatusCode:(NSInteger)statusCode headers:(NSDictionary *)headers outputData:(NSData * _Nullable)outputData resultType:(Class<DictionaryParser> _Nullable)resultType success:(void (^)(id<DictionaryParser> _Nullable))successBlock fail:(ErrorBlock)failBlock
{
    if (!headers)
    {
        if (failBlock)
        {
            failBlock([ObjectiveDropboxError errorWithSummary:@"Headers are missing"]);
        }
        return;
    }
    if (resultType == Nil)
    {
        if (successBlock)
        {
            successBlock(nil);
        }
        return;
    }
    NSData *jsonData = outputData;
    if (!jsonData)
    {
        jsonData = headers[@"Dropbox-API-Result"];
    }
    if ([jsonData isKindOfClass:[NSString class]])
    {
        jsonData = [((NSString *)jsonData) dataUsingEncoding:NSUTF8StringEncoding];
    }
    if (statusCode != 200)
    {
        [DropboxHttpHelper handleDropboxRequestErrorWithStatusCode:statusCode outputContent:jsonData outputHeadersDic:headers errorBlock:failBlock];
        return;
    }    
    
    NSError *error;
    if (jsonData)
    {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        if (error)
        {
            if (failBlock)
            {
                failBlock([ObjectiveDropboxError errorWithSummary:[NSString stringWithFormat:@"JSON parsing error: %@", error.description]]);
            }
            return;
        }
        id meta = [[(Class)resultType alloc] initWithDictionary:dic];
        BOOL ok = [self checkParseResult:meta fail:failBlock];
        
        if (ok)
        {
            successBlock(meta);
        }
    }
    else
    {
        if (successBlock)
        {
            successBlock(nil);
        }
    }
}

- (DropboxDownloadTask *)contentDownloadEndpointWithRoute:(NSString *)route param:(id<DictionarySerializer>)arg destinationFileUrl:(NSURL *)destUrl resultType:(Class<DictionaryParser> _Nullable)resultType progress:(DownloadTaskProgressHandler)progressBlock success:(void (^)(id<DictionaryParser> _Nullable))successBlock fail:(ErrorBlock)failBlock
{
    NSDictionary *dic = arg ? [arg dictionaryFromParams] : @{};
    NSDictionary *headers = [self getDownloadHeadersWithParams:dic];
    NSURL *url = [self urlWithDownloadMethod:route];
    NSURLRequest *request = [DropboxHttpHelper createRequestWithHttpHeaders:headers url:url content:nil];
    NSURLSessionDownloadTask *task = [self.backgroundSession downloadTaskWithRequest:request];
    
    DropboxDownloadTask *downloadTask = [self.sessionDelegate addDownloadTask:task session:self.backgroundSession destinationUrl:destUrl successHandler:^(NSDictionary *headers, NSInteger statusCode) {
        [self checkDownloadResultWithStatusCode:statusCode headers:headers outputData:nil resultType:resultType success:successBlock fail:failBlock];
    } progressHandler:progressBlock failHandler:^(NSString *errorSummary) {
        [DropboxHttpHelper handleErrorSummary:errorSummary withFail:failBlock];
    }];
    [task resume];
    return downloadTask;
}

#pragma mark - Handle errors

+ (void)handleDropboxRequestErrorWithStatusCode:(NSInteger)statusCode outputContent:(NSData * _Nullable)outputContent outputHeadersDic:(NSDictionary * _Nullable)outputHeadersDic errorBlock:(nullable ErrorBlock)errorBlock
{
    if (!errorBlock) return;
    
    __block DropboxError *dropboxError;
    NSError *error;
    NSDictionary *bodyDic;
    if (outputContent)
    {
        bodyDic = [NSJSONSerialization JSONObjectWithData:outputContent options:NSJSONReadingMutableContainers error:&error];
    }
    
    NSString *errorSummary;
    if (bodyDic)
    {
        errorSummary = bodyDic[keyErrorMessage];
    }
    else if (outputContent)
    {
        errorSummary = [[NSString alloc] initWithData:outputContent encoding:NSUTF8StringEncoding];
    }
    
    // Bad input parameter
    if (statusCode == 400)
    {
        NSString *defaultMessage = @"Bad input parameter";
        errorSummary = [self errorSummaryWithSummary:errorSummary defaultMessage:defaultMessage];
        dropboxError = [[DropboxErrorBadInputParameter alloc] initWithErrorSummary:errorSummary];
    }
    // Bad or expired token
    else if (statusCode == 401)
    {
        NSString *defaultMessage = @"Bad or expired token";
        errorSummary = [self errorSummaryWithSummary:errorSummary defaultMessage:defaultMessage];
        dropboxError = [[DropboxErrorBadOrExpiredToken alloc] initWithErrorSummary:errorSummary ? errorSummary : defaultMessage];
    }
    // Endpoint-specific error
    else if (statusCode == 409)
    {
        NSString *defaultMessage = @"Endpoint-specific error";
        errorSummary = [self errorSummaryWithSummary:errorSummary defaultMessage:defaultMessage];
        dropboxError = [[DropboxErrorEndpointSpecific alloc] initWithErrorSummary:errorSummary ? errorSummary : defaultMessage];
    }
    // Too many requests
    else if (statusCode == 429)
    {
        if (outputHeadersDic)
        {
            NSString *retryAfter = outputHeadersDic[@"Retry-After"];
            double retryAfterSeconds = retryAfter.doubleValue;
            
            NSString *defaultMessage = [NSString stringWithFormat:@"Too many requests. Retry after %i seconds", (int)retryAfterSeconds];
            errorSummary = [self errorSummaryWithSummary:errorSummary defaultMessage:defaultMessage];
            dropboxError = [[DropboxErrorTooManyRequests alloc] initWithErrorSummary:errorSummary retryAfterSeconds:retryAfterSeconds];
        }
        else
        {
            dropboxError = [[DropboxError alloc] initWithErrorSummary:@"Too many requests. Try again later."];
        }
    }
    // An error occurred on the Dropbox servers
    else if (statusCode >= 500 && statusCode < 600)
    {
        NSString *defaultMessage = @"An error occurred on the Dropbox servers";
        errorSummary = [self errorSummaryWithSummary:errorSummary defaultMessage:defaultMessage];
        dropboxError = [[DropboxErrorDropboxServers alloc] initWithErrorSummary:errorSummary];
    }
    // Unknown error
    else
    {
        dropboxError = [[DropboxError alloc] initWithErrorSummary:errorSummary ? errorSummary : @"Unknown error"];
    }
    
    errorBlock(dropboxError);
}

+ (void)handleErrorSummary:(NSString *)errorSummary withFail:(ErrorBlock)failBlock
{
    DropboxError *error = [[DropboxError alloc] initWithErrorSummary:errorSummary];
    if (failBlock)
    {
        failBlock(error);
    }
}

+ (NSString *)errorSummaryWithSummary:(NSString *)summary defaultMessage:(NSString *)defaultMessage
{
    return summary ? [NSString stringWithFormat:@"%@. %@", defaultMessage, summary] : defaultMessage;
}

@end
