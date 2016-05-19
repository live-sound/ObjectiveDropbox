//
//  DropboxSearchMatch.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxSearchMatch.h"

@implementation DropboxSearchMatch

- (instancetype)init
{
    self = [super init];
    self.matchType = unknown;
    return self;
}

- (NSString *)description
{
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"{ "];
    [result appendFormat:@"%@: ", [self stringFromMatchType:self.matchType]];
    [result appendFormat:@"\"%@\"", self.metadata.pathDisplay];
    [result appendString:@" }"];
    return result;
}

- (NSString *)stringFromMatchType:(DropboxSearchMatchType)matchType
{
    switch (matchType) {
        case filename:
            return @"filename";
        case content:
            return @"content";
        case both:
            return @"filename and content";
        default:
            return @"";
    }
}

@end
