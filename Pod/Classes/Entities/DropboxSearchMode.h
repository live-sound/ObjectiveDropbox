//
//  DropboxSearchMode.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#ifndef DropboxSearchMode_h
#define DropboxSearchMode_h

/**
 The search mode (filename, filename_and_content, or deleted_filename). Note that searching file content is only available for Dropbox Business accounts. The default for this union is filename.
 */
typedef enum : NSUInteger {
    /**
     *  Search file and folder names.
     */
    fileName,
    /**
     *  Search file and folder names as well as file contents.
     */
    fileNameAndContent,
    /**
     *  Search for deleted file and folder names.
     */
    deletedFileName,
} DropboxSearchMode;

#endif /* DropboxSearchMode_h */
