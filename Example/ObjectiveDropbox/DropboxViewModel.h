//
//  DropboxViewModel.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DropboxViewModelProtocol.h"
#import "DropboxClient.h"

@interface DropboxViewModel : NSObject <DropboxViewModelProtocol>

- (void)startTesting;

@property (nullable, weak) id<DropboxViewModelDelegate> delegate;
@property (nonatomic, nonnull) DropboxClient *dropbox;

@end
