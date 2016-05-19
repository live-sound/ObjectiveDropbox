//
//  DropboxAuthViewControllerProtocol.h
//  Pods
//
//  Created by Михаил Мотыженков on 19.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAuthDelegate.h"

@protocol DropboxAuthViewControllerProtocol <NSObject>

@property (nonatomic, weak) id<DropboxAuthDelegate> delegate;
@property (nonatomic) NSString * appKey;
@property (nonatomic) NSString *redirectURL;

@end
