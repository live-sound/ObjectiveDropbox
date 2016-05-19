//
//  DropboxUrlSessionDelegate.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.05.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxUrlSessionDelegateProtocol.h"
#import "DropboxDownloadTaskDelegate.h"

@interface DropboxUrlSessionDelegate : NSObject <DropboxUrlSessionDelegateProtocol, DropboxDownloadTaskDelegate>

- (void)restartAllTasksFromSession:(NSURLSession *)session;

@end
