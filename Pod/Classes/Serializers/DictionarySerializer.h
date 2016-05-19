//
//  DictionarySerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import <Foundation/Foundation.h>

@protocol DictionarySerializer <NSObject>

- (NSDictionary * _Nonnull)dictionaryFromParams;

@end
