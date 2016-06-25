//
//  DropboxGetThumbnailArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxGetThumbnailArg+DictionarySerializer.h"
#import "DropboxThumbnailSizeToStringSerializer.h"
#import "DropboxThumbnailFormatToStringSerializer.h"

@implementation DropboxGetThumbnailArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSString *formatString = [DropboxThumbnailFormatToStringSerializer stringFromEnum:self.format];
    NSString *thumbnailSizeString = [DropboxThumbnailSizeToStringSerializer stringFromEnum:self.size];
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    dic[@"path"] = self.path;
    if (formatString)
    {
        dic[@"format"] = formatString;
    }
    if (thumbnailSizeString)
    {
        dic[@"size"] = thumbnailSizeString;
    }
    return [dic copy];
}


@end
