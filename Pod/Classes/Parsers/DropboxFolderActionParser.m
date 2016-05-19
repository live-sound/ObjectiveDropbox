//
//  DropboxFolderActionParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxFolderActionParser.h"

@implementation DropboxFolderActionParser

+ (DropboxFolderAction)folderActionFromString:(NSString * _Nonnull)string
{
    if ([string isEqualToString:@"change_options"])
    {
        return DFAChangeOptions;
    }
    else if ([string isEqualToString:@"edit_contents"])
    {
        return DFAEditContents;
    }
    else if ([string isEqualToString:@"invite_editor"])
    {
        return DFAInviteEditor;
    }
    else if ([string isEqualToString:@"invite_viewer"])
    {
        return DFAInviteViewer;
    }
    else if ([string isEqualToString:@"relinquish_membership"])
    {
        return DFARelinquishMembership;
    }
    else if ([string isEqualToString:@"unmount"])
    {
        return DFAUnmount;
    }
    else if ([string isEqualToString:@"unshare"])
    {
        return DFAUnshare;
    }
    else if ([string isEqualToString:@"leave_a_copy"])
    {
        return DFALeaveACopy;
    }
    return DFANotSet;
}

@end
