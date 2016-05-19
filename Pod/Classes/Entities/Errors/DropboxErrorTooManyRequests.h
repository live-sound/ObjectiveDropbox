//
//  DropboxErrorTooManyRequests.h
//  Pods
//
//  Created by Михаил Мотыженков on 14.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxError.h"

@interface DropboxErrorTooManyRequests : DropboxError

@property (nonatomic) double retryAfterSeconds;

- (nonnull instancetype)initWithErrorSummary:(NSString * _Nonnull)errorSummary retryAfterSeconds:(double)retryAfterSeconds;

@end
