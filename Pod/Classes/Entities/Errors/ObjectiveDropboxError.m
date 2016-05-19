//
//  ObjectiveDropboxError.m
//  Pods
//
//  Created by Михаил Мотыженков on 18.04.16.
//
//

#import "ObjectiveDropboxError.h"

@implementation ObjectiveDropboxError

+ (ObjectiveDropboxError *)errorWithSummary:(NSString *)errorSummary
{
    ObjectiveDropboxError *error = [[ObjectiveDropboxError alloc] initWithErrorSummary:errorSummary];
    return error;
}

@end
