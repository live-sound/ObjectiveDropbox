//
//  DropboxName+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxName+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxName (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.givenName = [helper stringWithKey:@"given_name"];
        self.surname = [helper stringWithKey:@"surname"];
        self.familiarName = [helper stringWithKey:@"familiar_name"];
        self.displayName = [helper stringWithKey:@"display_name"];
    }
    return self;
}

@end
