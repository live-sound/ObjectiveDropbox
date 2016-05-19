//
//  DropboxPollArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>

/**
 *  Arguments for methods that poll the status of an asynchronous job. This datatype comes from an imported namespace originally defined in the async namespace.
 */
@interface DropboxPollArg : NSObject

/**
 *  Id of the asynchronous job. This is the value of a response returned from the method that launched the job.
 */
@property (nonatomic, nonnull) NSString *asyncJobID;


- (nonnull instancetype)initWithAsyncJobID:(NSString * _Nonnull)asyncJobID;

@end
