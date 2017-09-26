//
//  KLSuggestViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSuggestViewController.h"
#import "KLSuggestionView.h"
@interface KLSuggestViewController ()<UITextViewDelegate,KLsuggestionViewDelegate>

@property(strong,nonatomic)KLSuggestionView *suggestView;

@end

@implementation KLSuggestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
    [self addsugView];
}

#pragma mark 设置navView
-(void)setNav{
    
    self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:@"意见反馈"];
    
}

#pragma mark 设置UI
-(void)addsugView{
    
    self.suggestView = [KLSuggestionView initView];
    
    self.suggestView.contentView.delegate = self;
    
    [self.suggestView setUI];
    
    self.suggestView.delegate= self;
    
    self.suggestView.frame= CGRectMake(0, 64, SCREEN_WIDTH, SCREENH_HEIGHT-64);
    
    [self.view addSubview:self.suggestView];
    
}


-(void)submitWithContent:(NSString *)content andPhone:(NSString *)phone{
    
    NSLog(@"%@>>%@",content,phone);
}

#pragma mark UITextViewDelegate
/**
 // 将要开始编辑 - (BOOL)textViewShouldBeginEditing:(UITextView *)textView; 
 // 将要结束编辑 - (BOOL)textViewShouldEndEditing:(UITextView *)textView; 
 // 开始编辑 - (void)textViewDidBeginEditing:(UITextView *)textView; 
 // 结束编辑 - (void)textViewDidEndEditing:(UITextView *)textView;
 // 文本将要改变 - (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text; 
 // 文本发生改变 - (void)textViewDidChange:(UITextView *)textView; 
 // 焦点发生改变 - (void)textViewDidChangeSelection:(UITextView *)textView; 
 // 是否允许对文本中的URL进行操作 - (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0); 
 // 是否允许对文本中的富文本进行操作 - (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0);

 */
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    self.suggestView.placeHolderLabel.hidden = YES;
    
}


-(void)textViewDidEndEditing:(UITextView *)textView{
    
    if (!textView.text) {
        self.suggestView.placeHolderLabel.hidden= NO;
    }
}

-(void)textViewDidChange:(UITextView *)textView{
    
    if (!textView.text) {
        self.suggestView.placeHolderLabel.hidden= NO;
    }
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
    NSUInteger location = replacementTextRange.location;
    if (textView.text.length + text.length > 20){
        if (location != NSNotFound){
            [textView resignFirstResponder];
        }
        return NO;
    }
    else if (location != NSNotFound){
        [textView resignFirstResponder];
        return NO;
    }
    
    if (textView.text.length + text.length == 0) {
        self.suggestView.placeHolderLabel.hidden= NO;
    }else{
        self.suggestView.placeHolderLabel.hidden= YES;
    }
    
    return YES;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.suggestView.phoneTextField resignFirstResponder];
    
    [self.suggestView.contentView resignFirstResponder];
}

@end
