//
//  DropboxSpaceAllocation+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxSpaceAllocation+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxSpaceAllocationEnumParser.h"
#import "DropboxIndividualSpaceAllocation+DictionaryParser.h"
#import "DropboxTeamSpaceAllocation+DictionaryParser.h"

@implementation DropboxSpaceAllocation (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *tag = [helper stringWithKey:@".tag"];
    if (tag)
    {
        self.type = [DropboxSpaceAllocationEnumParser spaceAllocationFromString:tag];
    }
    switch (self.type) {
        case DSAIndividual:
            self.valueIndividual = [[DropboxIndividualSpaceAllocation alloc] initWithDictionary:dic];
            break;
        case DSATeam:
            self.valueTeam = [[DropboxTeamSpaceAllocation alloc] initWithDictionary:dic];
            break;
        default:
            break;
    }
    
    return self;
}

@end
