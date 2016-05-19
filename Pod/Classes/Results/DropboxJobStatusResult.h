//
//  DropboxJobStatus.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//


typedef enum : NSUInteger {
    /**
     *  The asynchronous job is still in progress.
     */
    inProgress,
    
    /**
     *  The asynchronous job has finished.
     */
    complete,
    
    /**
     *  The asynchronous job returned an error.
     */
    failed,
    jobStatusUnknown
} DropboxJobStatusEnum;


@interface DropboxJobStatusResult : NSObject

@property (nonatomic) DropboxJobStatusEnum status;

/**
 *  Used when status = failed.
 */
@property (nonatomic, nullable) NSString *errorSummary;

@end