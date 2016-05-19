//
//  DropboxError.h
//  Pods
//
//  Created by Михаил Мотыженков on 14.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxError : NSObject

@property (nonatomic, nonnull) NSString *errorSummary;

- (nonnull instancetype)initWithErrorSummary:(NSString * _Nonnull)errorSummary;

@end
