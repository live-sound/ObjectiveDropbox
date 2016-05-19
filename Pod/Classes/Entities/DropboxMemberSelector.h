//
//  DropboxMemberSelector.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>

/**
 Includes different ways to identify a member of a shared folder.
 */
typedef enum : NSUInteger {
    /**
     *  Dropbox account, team member, or group ID of member.
     */
    DMSDropboxID,
    
    /**
     *  E-mail address of member.
     */
    DMSEmail,
    DMSNotSet
} DropboxMemberSelectorEnum;


@interface DropboxMemberSelector : NSObject

@property (nonatomic) DropboxMemberSelectorEnum type;
@property (nonatomic, nonnull) NSString *value;

- (nonnull instancetype)initWithDropboxID:(NSString * _Nonnull)dropboxID;
- (nonnull instancetype)initWithEmail:(NSString * _Nonnull)email;

@end
