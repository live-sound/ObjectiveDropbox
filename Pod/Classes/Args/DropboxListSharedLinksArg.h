//
//  DropboxListSharedLinksArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxListSharedLinksArg : NSObject

/**
 *  See listSharedLinks description. This field is optional.
 */
@property (nonatomic, nullable) NSString *path;

/**
 *  The cursor returned by your last call to listSharedLinks. This field is optional.
 */
@property (nonatomic, nullable) NSString *cursor;

/**
 *  See listSharedLinks description. This field is optional.
 */
@property (nonatomic) BOOL directOnly;


- (nonnull instancetype)initWithPath:(NSString * _Nullable)path cursor:(NSString * _Nullable)cursor directOnly:(BOOL)directOnly;
- (nonnull instancetype)initWithPath:(NSString * _Nullable)path cursor:(NSString * _Nullable)cursor;
- (nonnull instancetype)initWithPath:(NSString * _Nullable)path;
- (nonnull instancetype)initWithCursor:(NSString * _Nullable)cursor;

@end
