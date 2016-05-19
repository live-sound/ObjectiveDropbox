//
//  DropboxLaunchEmptyResultEnum.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

typedef enum : NSUInteger {    
    /**
     *  This response indicates that the processing is asynchronous.
     */
    DLERAsyncJobID,
    
    /**
     *  The job finished synchronously and successfully.
     */
    DLERComplete,
    DLERNotSet
} DropboxLaunchEmptyResultEnum;