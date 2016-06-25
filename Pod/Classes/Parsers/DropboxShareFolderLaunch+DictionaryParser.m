//
//  DropboxShareFolderLaunch+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxShareFolderLaunch+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxShareFolderLaunchEnumParser.h"
#import "DropboxSharedFolderMetadata+DictionaryParser.h"

@implementation DropboxShareFolderLaunch (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        NSString *tag = [helper stringWithKey:@".tag"];
        if (tag)
        {
            self.type = [DropboxShareFolderLaunchEnumParser enumFromString:tag];
        }
        switch (self.type) {
            case DSFLAsyncJobID:
                self.asyncJobIDValue = [helper stringWithKey:tag];
                break;
            case DSFLComplete:
                self.completeValue = [[DropboxSharedFolderMetadata alloc] initWithDictionary:dic];
                break;
            default:
                break;
        }
    }
    return self;
}

@end
