//
//  DropboxAuthCompletedProtocol.h
//  Pods
//
//  Created by Михаил Мотыженков on 15.04.16.
//
//

#import <Foundation/Foundation.h>

@protocol DropboxAuthDelegate <NSObject>

- (void)dropboxAuthCompletedWithAccessToken:(NSString *)accessToken tokenType:(NSString *)tokenType uid:(NSString *)uid;
- (void)dropboxAuthCanceled;

@end
