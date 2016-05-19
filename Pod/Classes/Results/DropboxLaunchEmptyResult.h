//
//  DropboxLaunchEmptyResult.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxLaunchEmptyResultEnum.h"

/**
 *  Result returned by methods that may either launch an asynchronous job or complete synchronously. Upon synchronous completion of the job, no additional information is returned.
 */
@interface DropboxLaunchEmptyResult : NSObject

@property (nonatomic) DropboxLaunchEmptyResultEnum type;

/**
 *  The string is an id that can be used to obtain the status of the asynchronous job.
 */
@property (nonatomic, nonnull) NSString *value;

@end
