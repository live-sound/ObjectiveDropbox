//
//  DropboxViewController.h
//  ObjectiveDropbox
//
//  Created by Mikhail Motyzhenkov on 04/13/2016.
//  Copyright (c) 2016 Mikhail Motyzhenkov. All rights reserved.
//

@import UIKit;
#import "DropboxViewModelProtocol.h"

@interface DropboxViewController : UIViewController <DropboxViewModelDelegate>

@property (nonatomic) id<DropboxViewModelProtocol> viewModel;

@property (weak, nonatomic) IBOutlet UIButton *buttonStartTesting;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextView *tvSuccess;
@property (weak, nonatomic) IBOutlet UITextView *tvError;


@end
