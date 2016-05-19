//
//  ObjectiveDropboxError.h
//  Pods
//
//  Created by Михаил Мотыженков on 18.04.16.
//
//

#import "DropboxError.h"

@interface ObjectiveDropboxError : DropboxError

+ (nonnull ObjectiveDropboxError *)errorWithSummary:(NSString * _Nonnull)errorSummary;

@end
