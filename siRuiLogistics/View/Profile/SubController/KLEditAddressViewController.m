//
//  KLEditAddressViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLEditAddressViewController.h"

@interface KLEditAddressViewController ()<UITextViewDelegate>

@end

@implementation KLEditAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNav];
    self.addressTextView.delegate = self;
}

#pragma mark 设置navView
-(void)setNav{
    
    self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:@"收货地址"];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.phoneTextField resignFirstResponder];
    
    [self.nameTextField resignFirstResponder];
    
    [self.addressTextView resignFirstResponder];
    
}

- (IBAction)sureBtnClick:(id)sender {
    //提交
    
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
        self.placeHolderLabel.hidden= NO;
    }else{
        self.placeHolderLabel.hidden= YES;
    }
    
    return YES;
}

@end
