//
//  DropboxWriteMode.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>

/**
 Your intent when writing a file to some path. This is used to determine what constitutes a conflict and what the autorename strategy is.
 In some situations, the conflict behavior is identical: (a) If the target path doesn't contain anything, the file is always written; no conflict. (b) If the target path contains a folder, it's always a conflict. (c) If the target path contains a file with identical contents, nothing gets written; no conflict.
 The conflict checking differs in the case where there's a file at the target path with contents different from the contents you're trying to write.
 */
typedef enum : NSUInteger {
    /**
     *  Never overwrite the existing file. The autorename strategy is to append a number to the file name. For example, "document.txt" might become "document (2).txt".
     */
    DWMAdd,
    /**
     *  Always overwrite the existing file. The autorename strategy is the same as it is for add.
     */
    DWMOverwrite,
    /**
     *  Overwrite if the given "rev" matches the existing file's "rev". The autorename strategy is to append the string "conflicted copy" to the file name. For example, "document.txt" might become "document (conflicted copy).txt" or "document (Panda's conflicted copy).txt".
     */
    DWMUpdate,
    DWMNotSet
} DropboxWriteModeEnum;

@interface DropboxWriteMode : NSObject

/**
 *  Your intent when writing a file to some path. This is used to determine what constitutes a conflict and what the autorename strategy is.
 In some situations, the conflict behavior is identical: (a) If the target path doesn't contain anything, the file is always written; no conflict. (b) If the target path contains a folder, it's always a conflict. (c) If the target path contains a file with identical contents, nothing gets written; no conflict.
 The conflict checking differs in the case where there's a file at the target path with contents different from the contents you're trying to write.
 */
@property (nonatomic) DropboxWriteModeEnum mode;

/**
 *  Used only for Update value in mode
 */
@property (nonatomic, nullable) NSString *updateString;

/**
 *  Recommended initializer
 *
 *  @param mode         Your intent when writing a file to some path. This is used to determine what constitutes a conflict and what the autorename strategy is.
 In some situations, the conflict behavior is identical: (a) If the target path doesn't contain anything, the file is always written; no conflict. (b) If the target path contains a folder, it's always a conflict. (c) If the target path contains a file with identical contents, nothing gets written; no conflict.
 The conflict checking differs in the case where there's a file at the target path with contents different from the contents you're trying to write.
 *  @param updateString Used only for Update value in mode. Pass nil with other mode values
 *
 *  @return
 */
- (nonnull instancetype)initWithMode:(DropboxWriteModeEnum)mode updateString:(NSString * _Nullable)updateString;
- (nonnull instancetype)initWithOverwrite;
- (nonnull instancetype)initWithAdd;
- (nonnull instancetype)initWithUpdate:(NSString * _Nonnull)update;

@end
