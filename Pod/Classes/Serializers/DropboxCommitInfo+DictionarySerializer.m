//
//  DropboxCommitInfo+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxCommitInfo+DictionarySerializer.h"
#import "DropboxWriteMode+DictionarySerializer.h"
#import "NSDate+DateToDropboxString.h"

@implementation DropboxCommitInfo (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    result[@"path"] = self.path;
    result[@"mode"] = [self.mode dictionaryOrStringFromParams];
    result[@"autorename"] = @(self.autorename);
    if (self.clientModified)
    {
        result[@"client_modified"] = [self.clientModified dropboxDate];
    }
    result[@"mute"] = @(self.mute);
    return result;
}

@end
