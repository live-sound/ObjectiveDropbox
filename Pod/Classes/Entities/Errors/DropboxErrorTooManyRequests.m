//
//  DropboxErrorTooManyRequests.m
//  Pods
//
//  Created by Михаил Мотыженков on 14.04.16.
//
//

#import "DropboxErrorTooManyRequests.h"

@implementation DropboxErrorTooManyRequests

- (instancetype)initWithErrorSummary:(NSString *)errorSummary retryAfterSeconds:(double)retryAfterSeconds
{
    self = [self initWithErrorSummary:errorSummary];
    self.retryAfterSeconds = retryAfterSeconds;
    return self;
}

@end
