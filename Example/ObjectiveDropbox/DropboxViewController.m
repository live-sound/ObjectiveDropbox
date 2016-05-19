//
//  DropboxViewController.m
//  ObjectiveDropbox
//
//  Created by Mikhail Motyzhenkov on 04/13/2016.
//  Copyright (c) 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import "DropboxViewController.h"
#import "DropboxViewModel.h"

@implementation DropboxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!self.viewModel)
    {
        self.viewModel = [[DropboxViewModel alloc] initWithDelegate:self];
    }
}

- (IBAction)buttonTestTouched:(id)sender {
    self.buttonStartTesting.enabled = NO;
    self.tvSuccess.text = self.tvError.text = @"";
    [self.activityIndicator startAnimating];
    [self.viewModel startTesting];
}


#pragma mark - ViewModelDelegate

- (void)viewModelTestingFinished
{
    [self.activityIndicator stopAnimating];
    self.buttonStartTesting.enabled = YES;
}

- (void)viewModelSuccess:(NSString *)successMessage
{
    [self appendMessage:successMessage toTextView:self.tvSuccess];
}

- (void)viewModelError:(NSString *)errorMessage
{
    [self appendMessage:errorMessage toTextView:self.tvError];
}


#pragma mark - Text methods

- (void)appendMessage:(NSString *)message toTextView:(UITextView *)tv
{
    tv.text = [NSString stringWithFormat:@"%@%@\n---\n", tv.text, message];
    [tv scrollRangeToVisible:NSMakeRange(tv.text.length-1, 1)];
}

@end
