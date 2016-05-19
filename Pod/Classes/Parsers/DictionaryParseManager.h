//
//  DictionaryParseManager.h
//  Pods
//
//  Created by Михаил Мотыженков on 30.04.16.
//
//

#import <Foundation/Foundation.h>

@protocol DictionaryParseManager <NSObject>

+ (nullable id)parseDic:(NSDictionary * _Nonnull)dic;

@end
