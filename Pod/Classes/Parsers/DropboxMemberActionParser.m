//
//  DropboxMemberActionParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxMemberActionParser.h"

@implementation DropboxMemberActionParser

+ (DropboxMemberAction)memberActionFromString:(NSString * _Nonnull)string
{
    if ([string isEqualToString:@"make_editor"])
    {
        return DMAMakeEditor;
    }
    else if ([string isEqualToString:@"make_owner"])
    {
        return DMAMakeOwner;
    }
    else if ([string isEqualToString:@"make_viewer"])
    {
        return DMAMakeViewer;
    }
    else if ([string isEqualToString:@"remove"])
    {
        return DMARemove;
    }
    return DMANotSet;
}

@end
