//
//  DropboxDefines.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#ifndef DropboxDefines_h
#define DropboxDefines_h

#define NotNull(a) (a && ![a isEqual:[NSNull null]])

#import "DropboxError.h"

typedef void(^ErrorBlock)(DropboxError * _Nonnull error);
typedef void(^CompletionBlockWithHeadersAndBody)(NSDictionary * _Nullable headers, NSData * _Nullable data);
typedef void(^CompletionBlockWithStatusCodeHeadersAndBody)(int statusCode, NSDictionary * _Nullable headers, NSData * _Nullable data);
typedef void(^CompletionBlockWithDictionary)(NSDictionary * _Nonnull bodyDic);
typedef void(^CompletionBlockWithArray)(NSArray * _Nonnull bodyArray);


#endif /* DropboxDefines_h */
