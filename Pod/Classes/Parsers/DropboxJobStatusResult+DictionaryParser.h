//
//  DropboxJobStatusResult+DictionaryParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxJobStatusResult.h"
#import "DictionaryParser.h"

@interface DropboxJobStatusResult (DictionaryParser) <DictionaryParser>

+ (NSString * _Nullable)errorSummaryFromDictionary:(NSDictionary * _Nonnull)dic;

@end
