//
//  DropboxUrlSessionHandlers.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.05.16.
//
//

typedef void(^DownloadTaskSuccessHandler)(NSDictionary * _Nullable headers, NSInteger statusCode);
typedef void(^DownloadTaskFailHandler)(NSString * _Nonnull errorSummary);
typedef void(^DownloadTaskProgressHandler)(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite);
typedef void(^UploadTaskSuccessHandler)(NSDictionary * _Nullable headers, NSData * _Nullable outputData, NSInteger statusCode);
typedef void(^UploadTaskFailHandler)(NSString * _Nonnull errorSummary);
typedef void(^UploadTaskProgressHandler)(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend);