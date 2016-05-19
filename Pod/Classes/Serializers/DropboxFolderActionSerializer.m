//
//  DropboxFolderActionDictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxFolderActionSerializer.h"

@implementation DropboxFolderActionSerializer

+ (NSDictionary *)dictionaryFromFolderAction:(DropboxFolderAction)action
{
    if (action != DFANotSet)
    {
        NSString *string = [self stringFromEnum:action];
        if (string)
        {
            return @{@".tag": string};
        }
    }
    return @{};
}

+ (NSString *)stringFromEnum:(DropboxFolderAction)action
{
    switch (action) {
        case DFAChangeOptions:
            return @"change_options";
        case DFAEditContents:
            return @"edit_contents";
        case DFAInviteEditor:
            return @"invite_editor";
        case DFAInviteViewer:
            return @"invite_viewer";
        case DFARelinquishMembership:
            return @"relinquish_membership";
        case DFAUnmount:
            return @"unmount";
        case DFAUnshare:
            return @"unshare";
        case DFALeaveACopy:
            return @"leave_a_copy";
        default:
            return nil;
    }
}

@end
