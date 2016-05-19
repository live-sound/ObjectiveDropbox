//
//  DropboxMemberActionSerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxMemberActionSerializer.h"

@implementation DropboxMemberActionSerializer

+ (NSString * _Nullable)stringFromEnum:(DropboxMemberAction)action
{
    switch (action) {
        case DMAMakeEditor:
            return @"make_editor";
        case DMAMakeOwner:
            return @"make_owner";
        case DMAMakeViewer:
            return @"make_viewer";
        case DMARemove:
            return @"remove";
        default:
            return nil;
    }
}

@end
