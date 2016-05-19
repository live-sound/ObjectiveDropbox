//
//  DropboxMemberSelector+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxMemberSelector+DictionarySerializer.h"

@implementation DropboxMemberSelector (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSString *type = [self stringFromType:self.type];
    return @{ @".tag": type,
              type: self.value };
}

- (NSString * _Nonnull)stringFromType:(DropboxMemberSelectorEnum)type
{
    switch (type) {
        case DMSEmail:
            return @"email";
        case DMSDropboxID:
            return @"dropbox_id";
        default:
            return @"unknown";
    }
}

@end
