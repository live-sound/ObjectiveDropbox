//
//  DropboxWriteMode+DictionarySerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxWriteMode.h"

@interface DropboxWriteMode (DictionarySerializer)

- (nonnull id)dictionaryOrStringFromParams;
- (NSString * _Nonnull)stringFromSelf;

@end
