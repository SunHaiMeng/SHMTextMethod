//
//  ViewController.m
//  SHMTextMethod
//
//  Created by apple on 2018/11/28.
//  Copyright © 2018年 GXT. All rights reserved.
//

#import "ViewController.h"
#import "SHMEmojiMethod.h"
@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController{
    UILabel *count;
 
    NSString *textC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
}
-(void)initUI{
    // 初始化输入框并设置位置和大小
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(20, 100,self.view.frame.size.width-40 ,100);
    // 设置预设文本
    if (textC.length==0) {
        textView.text = @"您的意见是我们前进的最大动力，谢谢！";
    }else{
        textView.text = textC;
    }
    
    // 设置文本字体
    textView.font = [UIFont systemFontOfSize:14];
    // 设置文本颜色
    textView.textColor = [UIColor grayColor];
    // 设置文本框背景颜色
    textView.backgroundColor = [UIColor whiteColor];
    // 设置文本对齐方式
    textView.textAlignment = NSTextAlignmentLeft;
    // 设置自动纠错方式
    textView.autocorrectionType = UITextAutocorrectionTypeNo;
    
    //外框
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 1;
    textView.layer.cornerRadius =5;
    textView.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
    
    textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    // 自动大写方式有以下几种：
    //    enum {
    //        UITextAutocapitalizationTypeNone,           不自动大写
    //        UITextAutocapitalizationTypeWords,          单词首字母大写
    //        UITextAutocapitalizationTypeSentences,      句子的首字母大写
    //        UITextAutocapitalizationTypeAllCharacters,  所有字母都大写
    //    } UITextAutocapitalizationType;
    
    // 设置键盘的样式
    textView.keyboardType = UIKeyboardTypeDefault;
    
    // 键盘样式有以下几种：
    //    enum {
    //        UIKeyboardTypeDefault,                默认键盘，支持所有字符
    //        UIKeyboardTypeASCIICapable,           支持ASCII的默认键盘
    //        UIKeyboardTypeNumbersAndPunctuation,  标准电话键盘，支持＋＊＃字符
    //        UIKeyboardTypeURL,                    只支持URL字符的URL键盘，支持.com按钮
    //        UIKeyboardTypeNumberPad,              数字键盘
    //        UIKeyboardTypePhonePad,               电话键盘
    //        UIKeyboardTypeNamePhonePad,           支持输入人名的电话键盘
    //        UIKeyboardTypeEmailAddress,           电子邮件键盘
    //        UIKeyboardTypeDecimalPad,             有数字和小数点的数字键盘
    //        UIKeyboardTypeTwitter,                优化的键盘，方便输入@、#字符
    //        UIKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable,
    //    } UIKeyboardType;
    
    // 设置return键样式
    textView.returnKeyType = UIReturnKeyDone;
    
    // return键有以下几种样式：
    //    enum {
    //        UIReturnKeyDefault,        默认，灰色按钮，标有Return
    //        UIReturnKeyGo,             标有Go的蓝色按钮
    //        UIReturnKeyGoogle,         标有Google的蓝色按钮，用于搜索
    //        UIReturnKeyJoin,           标有Join的蓝色按钮
    //        UIReturnKeyNext,           标有Next的蓝色按钮
    //        UIReturnKeyRoute,          标有Route的蓝色按钮
    //        UIReturnKeySearch,         标有Search的蓝色按钮
    //        UIReturnKeySend,           标有Send的蓝色按钮
    //        UIReturnKeyYahoo,          标有Yahoo的蓝色按钮
    //        UIReturnKeyYahoo,          标有Yahoo的蓝色按钮
    //        UIReturnKeyEmergencyCall,  紧急呼叫按钮
    //    } UIReturnKeyType;
    
    // 设置是否可以拖动
    textView.scrollEnabled = YES;
    // 设置代理
    textView.delegate = self;
    //自适应高度
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:textView];
    // 自定义文本框字数统计
    count = [[UILabel alloc] init];
    count.frame = CGRectMake(self.view.frame.size.width - 160, 200, 100, 20);
    if (textC.length==0) {
        count.text = @"0/100";
    }else{
        count.text = [NSString stringWithFormat:@"%lu/100", (unsigned long)textC.length];
    }
    
    count.textAlignment = NSTextAlignmentRight;
    count.font = [UIFont systemFontOfSize:14];
    count.backgroundColor = [UIColor clearColor];
    count.textColor = [UIColor redColor];
    count.enabled = NO;
    
    [self.view addSubview:count];
    
    
}
#pragma mark --textView
/**
 开始编辑
 @param textView textView
 */
- (void)textViewDidBeginEditing:(UITextView *)textView
{
//    [orderTable mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(headView.mas_bottom);
//        make.left.mas_equalTo(self.view.mas_left);
//        make.right.mas_equalTo(self.view.mas_right);
//        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-200);
//    }];
    
    //tabelview 至底部、至顶部方法一（针对有ssection的使用）
//    //    [orderTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]  atScrollPosition:UITableViewScrollPositionTop animated:false];
    
    //tabelview 至底部、至顶部方法二（直接至底部、至顶部）
//    [orderTable setContentOffset:CGPointMake(0, CGFLOAT_MAX)];

    if ([textView.text isEqualToString:@"您的意见是我们前进的最大动力，谢谢！"]) {
        
        textView.text = @"";
        
    }
}



/**
 结束编辑
 
 @param textView textView
 */
-(void)textViewDidEndEditing:(UITextView *)textView
{
    
    if (textView.text.length <1) {
        textView.text = @"您的意见是我们前进的最大动力，谢谢！";
    }
    
    
}


/**
 内容将要发生改变编辑 限制输入文本长度 监听TextView 点击了ReturnKey 按钮
 
 @param textView textView
 @param range    范围
 @param text     text
 
 @return BOOL
 */
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([SHMEmojiMethod iosCurrentKeyType]) {
        //   限制苹果系统输入法  禁止输入表情
        
        if ([SHMEmojiMethod iosStringContainsEmoji]) {
            
            return NO;
            
        }
    }else{
        //判断是否输入了emoji 表情
        if ([SHMEmojiMethod stringContainsEmoji:text]) {
            
            return NO;
            
        }
    }
    
    
    textC = textView.text;
    if (range.location < 100)
    {
        
        if ([text isEqualToString:@"\n"]) {
            
            //这里写按了ReturnKey 按钮后的代码
            [textView resignFirstResponder];
            return NO;
        }else{
            
            return  YES;
        }
        
        
    }else if (textView.text.length == 100){
        
        return NO;
        
    }else{
        
        return YES;
        
    }
    
    
    
}


/**
 内容发生改变编辑 自定义文本框placeholder
 有时候我们要控件自适应输入的文本的内容的高度，只要在textViewDidChange的代理方法中加入调整控件大小的代理即可
 @param textView textView
 */
- (void)textViewDidChange:(UITextView *)textView
{
    count.text = [NSString stringWithFormat:@"%lu/100", (unsigned long)textView.text.length];
    
}
@end
