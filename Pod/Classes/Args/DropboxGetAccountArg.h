//
//  DropboxGetAccountArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxGetAccountArg : NSObject

/**
 *  A user's account identifier.
 */
@property (nonatomic, nonnull) NSString *accountID;

- (nonnull instancetype)initWithAccountID:(NSString * _Nonnull)accountID;

@end
