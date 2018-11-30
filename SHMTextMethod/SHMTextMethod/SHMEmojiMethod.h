//
//  SHMEmojiMethod.h
//  MinSu
//
//  Created by apple on 2018/11/28.
//  Copyright © 2018年 GXT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface SHMEmojiMethod : NSObject
+ (BOOL)stringContainsEmoji:(NSString *)string;
+ (BOOL)iosStringContainsEmoji;
+ (BOOL)iosCurrentKeyType;
@end

NS_ASSUME_NONNULL_END
