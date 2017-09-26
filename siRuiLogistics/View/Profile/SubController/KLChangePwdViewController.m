//
//  KLChangePwdViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLChangePwdViewController.h"
#import "KLChangePwddView.h"


@interface KLChangePwdViewController ()<KLChangePwddViewDelegate>

//修改密码视图
@property(strong,nonatomic)KLChangePwddView *pwdView;


@end

@implementation KLChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self addPwdView];
}

#pragma mark 设置navView
-(void)setNav{
    
    self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:@"修改密码"];
    
}

#pragma mark 设置UI
-(void)addPwdView{
    
    self.pwdView = [KLChangePwddView initView];
    
    self.pwdView.delegate = self;
    [self.pwdView setUI];
    
    self.pwdView.backgroundColor = viewBackColor;
    
    self.view.backgroundColor = viewBackColor;
    
    self.pwdView.frame= CGRectMake(0, 64, SCREEN_WIDTH, 280);
    
    [self.view addSubview:self.pwdView];
    
}

#pragma mark KLChangePwddViewDelegate
-(void)changePwdWithOldPwd:(NSString *)oldPWd andNewPwd:(NSString *)newString andSurepwd:(NSString *)surePwd{
    NSLog(@"%@>>%@>>%@",oldPWd,newString,surePwd);
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.pwdView.oldPwdTextField resignFirstResponder];
    [self.pwdView.nnewTextField resignFirstResponder];
    [self.pwdView.surePwdTextField resignFirstResponder];
    
}

@end
