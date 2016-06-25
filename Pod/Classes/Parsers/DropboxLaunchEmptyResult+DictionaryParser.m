//
//  DropboxLaunchEmptyResult+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxLaunchEmptyResult+DictionaryParser.h"
#import "DropboxLaunchEmptyResultEnumParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxLaunchEmptyResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        NSString *string = [helper stringWithKey:@".tag"];
        if (string)
        {
            self.type = [DropboxLaunchEmptyResultEnumParser launchEmptyResultFromString:string];
        }
        if (self.type == DLERAsyncJobID)
        {
            self.value = [helper stringWithKey:string];
        }
    }
    return self;
}

@end
