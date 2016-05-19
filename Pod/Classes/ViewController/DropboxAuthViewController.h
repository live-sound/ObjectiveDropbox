//
//  DropboxAuthenticationViewController.h
//  Pods
//
//  Created by Михаил Мотыженков on 01.04.16.
//
//

#import <UIKit/UIKit.h>
#import "DropboxAuthViewControllerProtocol.h"

@interface DropboxAuthViewController : UIViewController <DropboxAuthViewControllerProtocol>

@property (nonatomic, weak) id<DropboxAuthDelegate> delegate;
@property (nonatomic) NSString *appKey;
@property (nonatomic) NSString *redirectURL;

@end
