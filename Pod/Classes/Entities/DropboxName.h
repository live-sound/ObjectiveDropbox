//
//  DropboxName.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>

/**
 *  Representations for a person's name to assist with internationalization.
 */
@interface DropboxName : NSObject

/**
 *  Also known as a first name.
 */
@property (nonatomic, nonnull) NSString *givenName;

/**
 *  Also known as a last name or family name.
 */
@property (nonatomic, nonnull) NSString *surname;

/**
 *  Locale-dependent name. In the US, a person's familiar name is their givenName, but elsewhere, it could be any combination of a person's givenName and surname.
 */
@property (nonatomic, nonnull) NSString *familiarName;

/**
 *  A name that can be used directly to represent the name of a user's Dropbox account.
 */
@property (nonatomic, nonnull) NSString *displayName;

@end
