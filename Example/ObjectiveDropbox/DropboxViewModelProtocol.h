//
//  DropboxViewModelProtocol.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DropboxViewModelDelegate <NSObject>

@optional
- (void)viewModelSuccess:(NSString * _Nonnull)successMessage;
- (void)viewModelError:(NSString * _Nonnull)errorMessage;
- (void)viewModelTestingFinished;

@end



@protocol DropboxViewModelProtocol <NSObject>

@property (nullable, weak) id<DropboxViewModelDelegate> delegate;

- (nonnull instancetype)initWithDelegate:(nullable id<DropboxViewModelDelegate>)delegate;

- (void)startTesting;

@end
