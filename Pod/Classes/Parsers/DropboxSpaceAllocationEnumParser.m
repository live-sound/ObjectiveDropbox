//
//  DropboxSpaceAllocationEnumParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxSpaceAllocationEnumParser.h"

@implementation DropboxSpaceAllocationEnumParser

+ (DropboxSpaceAllocationEnum)spaceAllocationFromString:(NSString *)string
{
    if ([string isEqualToString:@"individual"])
    {
        return DSAIndividual;
    }
    else if ([string isEqualToString:@"team"])
    {
        return DSATeam;
    }
    return DSANotSet;
}

@end
