//
//  DropboxDownloadTaskDelegate.h
//  Pods
//
//  Created by Михаил Мотыженков on 13.05.16.
//
//

#import <Foundation/Foundation.h>

@protocol DropboxDownloadTaskDelegate <NSObject>

- (void)downloadTaskDidResumeWithOldTask:(NSURLSessionDownloadTask *)oldTask newTask:(NSURLSessionDownloadTask *)newTask session:(NSURLSession *)session;

@end
