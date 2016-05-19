//
//  DropboxGetAccountBatchArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxGetAccountBatchArg : NSObject

/**
 *  List of user account identifiers. Should not contain any duplicate account IDs.
 */
@property (nonatomic, nonnull) NSArray<NSString *> *accountIDs;


- (nonnull instancetype)initWithAccountIDs:(NSString * _Nonnull)ID1, ... NS_REQUIRES_NIL_TERMINATION;

@end
