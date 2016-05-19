//
//  InitWithDictionaryProtocol.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DictionaryParser <NSObject>

- (nonnull instancetype)initWithDictionary:(NSDictionary * _Nonnull)dic;

@end
