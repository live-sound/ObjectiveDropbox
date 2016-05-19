//
//  DropboxAddMember+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxAddMember+DictionarySerializer.h"
#import "DropboxMemberSelector+DictionarySerializer.h"
#import "DropboxAccessLevelDictionarySerializer.h"

@implementation DropboxAddMember (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSDictionary *member = [self.member dictionaryFromParams];
    NSDictionary *accessLevel = [DropboxAccessLevelDictionarySerializer dictionaryFromAccessLevel:self.accessLevel];
    return @{ @"member": member,
              @"access_level": accessLevel};
}

@end
