//
//  DropboxRoutes.h
//  Pods
//
//  Created by Михаил Мотыженков on 01.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxDefines.h"
#import "DictionaryParser.h"
#import "DictionarySerializer.h"
#import "DictionaryParseManager.h"
#import "DropboxRoutesDelegate.h"

@interface DropboxRoutes : NSObject

@property (nonatomic, weak, nullable) id<DropboxRoutesDelegate> delegate;
@property (nonatomic, nonnull) NSString *path;

- (nonnull instancetype)initWithPath:(nonnull NSString *)path;
- (nonnull instancetype)initWithPath:(nonnull NSString *)path andWithDelegate:(nonnull id<DropboxRoutesDelegate>)delegate;

@end
