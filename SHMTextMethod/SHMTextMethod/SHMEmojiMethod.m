//
//  SHMEmojiMethod.m
//  MinSu
//
//  Created by apple on 2018/11/28.
//  Copyright © 2018年 GXT. All rights reserved.
//

#import "SHMEmojiMethod.h"

@implementation SHMEmojiMethod
//判断是否输入了emoji 表情

+ (BOOL)stringContainsEmoji:(NSString *)string{
    
        __block BOOL returnValue = NO;
        [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences
        usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
            if (0xd800 <= hs && hs <= 0xdbff) {
                if (substring.length > 1) {
                    const unichar ls = [substring characterAtIndex:1];
                    const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f77f) {
                        returnValue = YES;
                    }
                }
            } else if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                if (ls == 0x20e3) {
                    returnValue = YES;
                }
            } else {
                if (0x2100 <= hs && hs <= 0x27ff) {
                    returnValue = YES;
                } else if (0x2B05 <= hs && hs <= 0x2b07) {
                    returnValue = YES;
                } else if (0x2934 <= hs && hs <= 0x2935) {
                    returnValue = YES;
                } else if (0x3297 <= hs && hs <= 0x3299) {
                    returnValue = YES;
                } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                    returnValue = YES;
                }else if (hs == 0x200d){
                    returnValue = YES;
                }
            }
        }];
        return returnValue;
    
}

//   限制苹果系统输入法  禁止输入表情
+ (BOOL)iosStringContainsEmoji{
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        
        return YES;
        
    }else{
        
        return NO;
    }
}
//  判断键盘是否为系统键盘
+ (BOOL)iosCurrentKeyType{
    NSString *currentKeyboardName = [[[[UITextInputMode activeInputModes] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isDisplayed = YES"]] lastObject] valueForKey:@"extendedDisplayName"];
    if([currentKeyboardName isEqualToString:@"简体拼音"] || [currentKeyboardName isEqualToString:@"表情符号"] || [currentKeyboardName isEqualToString:@"English (US)"]||[currentKeyboardName isEqualToString:@"Emoji"]) {
            //系统自带键盘
            return YES;
        }else{
            //第三方键盘
            return NO;
            
            }
    
    
}
@end
