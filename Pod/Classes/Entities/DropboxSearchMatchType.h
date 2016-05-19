//
//  DropboxSearchMatchType.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#ifndef DropboxSearchMatchType_h
#define DropboxSearchMatchType_h

/**
 Indicates what type of match was found for a given item. The value will be one of the following datatypes:
 */
typedef enum : NSUInteger {
    /**
     *  This item was matched on its file or folder name.
     */
    filename,
    /**
     *  This item was matched based on its file contents.
     */
    content,
    /**
     *  This item was matched based on both its contents and its file name. 
     */
    both,
    unknown
} DropboxSearchMatchType;

#endif /* DropboxSearchMatchType_h */
