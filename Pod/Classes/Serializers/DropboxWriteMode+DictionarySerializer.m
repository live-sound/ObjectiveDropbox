//
//  DropboxWriteMode+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxWriteMode+DictionarySerializer.h"

@implementation DropboxWriteMode (DictionarySerializer)

- (id)dictionaryOrStringFromParams
{
    if (self.mode == DWMUpdate && self.updateString)
    {
        NSDictionary *result = @{@".tag": [self stringFromSelf],
                                 @"update": self.updateString};
        return result;
    }
    else
    {
        return [self stringFromSelf];
    }
}

- (NSString *)stringFromSelf
{
    switch (self.mode) {
        case DWMAdd:
            return @"add";
        case DWMOverwrite:
            return @"overwrite";
        case DWMUpdate:
            return @"update";
        default:
            @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unsupported value of mode" userInfo:nil];
    }
}

@end
