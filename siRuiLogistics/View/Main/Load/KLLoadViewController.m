//
//  KLLoadViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/23.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLLoadViewController.h"
#import "KLChooseLanguageView.h"


@interface KLLoadViewController ()
//切换语言的功能视图
@property(strong,nonatomic)KLChooseLanguageView *chooseLanguageView;\


@end

@implementation KLLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    
    self.loadBtn.layer.cornerRadius = 5;
    
    self.loadBtn.layer.masksToBounds = YES;
    
    [self.accountTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(10);
        
        make.top.equalTo(self.view.mas_top).offset(550*SCREENH_HEIGHT/1334);
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-20, 30));
    }];
    
    [self.topImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(0);
        
        make.top.equalTo(self.view.mas_top).offset(0);
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 550*SCREENH_HEIGHT/1334));
    }];
    
    [self.languageBtn sizeToFit];
    
    
    
    
    [self initChangeLanguageView];
    
    [self initUI];
}


#pragma mark 初始化界面语言显示设置
-(void)initUI{
    
    [self.remBtn setTitle:NSLocalizedString(@"rememberPwd", nil) forState:UIControlStateNormal];
    
     [self.forgetPwdBtn setTitle:NSLocalizedString(@"forgetPwd", nil) forState:UIControlStateNormal];
    
    [self.languageBtn setTitle:NSLocalizedString(@"loadLanguage", nil) forState:UIControlStateNormal];
    
    [self.loadBtn setTitle:NSLocalizedString(@"load", nil) forState:UIControlStateNormal];
    
    
    self.accountTextField.placeholder = NSLocalizedString(@"loadAccount", nil);
    
    self.pwdTextField.placeholder =NSLocalizedString(@"loadPwd", nil);
    
}

#pragma mark 切换语言视图设置 KLIndexSearchMessageChangeViewDelegate
-(void)initChangeLanguageView{
    
    self.chooseLanguageView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLChooseLanguageView class]) owner:self options:nil] firstObject];
    [self.view addSubview:self.chooseLanguageView];
    [self.chooseLanguageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(50);
        make.top.equalTo(self.languageBtn.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(self.chooseLanguageView.frame.size.width, self.chooseLanguageView.frame.size.height));
    }];
    self.chooseLanguageView.layer.cornerRadius = 5;
    self.chooseLanguageView.layer.masksToBounds = YES;
    self.chooseLanguageView.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.accountTextField resignFirstResponder];
    [self.pwdTextField resignFirstResponder];
}

- (IBAction)changelanguageBtnClick:(id)sender {
    
    self.chooseLanguageView.hidden = !self.chooseLanguageView.hidden;
}



- (IBAction)forgetPwdBtnClick:(id)sender {
}

//登录系统
- (IBAction)loadBtnClick:(id)sender {
    
    
    //设置登录成功，沙盒存储登录信息
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"isLoad"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //设置根视图
    KLMainViewController * vc= [[KLMainViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController =vc;
    
}
@end
