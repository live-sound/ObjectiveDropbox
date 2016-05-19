//
//  DropboxError.m
//  Pods
//
//  Created by Михаил Мотыженков on 14.04.16.
//
//

#import "DropboxError.h"

@implementation DropboxError

- (instancetype)initWithErrorSummary:(NSString *)errorSummary
{
    self = [self init];
    self.errorSummary = errorSummary;
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"DropboxError: %@", self.errorSummary];
}

@end
