//
//  Dimensions.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxDimensions.h"

@implementation DropboxDimensions

- (BOOL)isEqual:(id)another
{
    if ([another isKindOfClass:[DropboxDimensions class]])
    {
        DropboxDimensions *anotherDim = (DropboxDimensions *)another;
        return self.width == anotherDim.width && self.height == anotherDim.height;
    }
    else
    {
        return NO;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"{ %llu x %llu }", self.width, self.height];
}

@end
