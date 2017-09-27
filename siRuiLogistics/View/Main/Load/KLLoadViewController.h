//
//  KLLoadViewController.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/23.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLLoadViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *loadBtn;
- (IBAction)loadBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *languageBtn;
- (IBAction)changelanguageBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *remBtn;
@property (weak, nonatomic) IBOutlet UIButton *rememberBtnClick;
@property (weak, nonatomic) IBOutlet UIButton *forgetPwdBtn;
- (IBAction)forgetPwdBtnClick:(id)sender;

-(void)initUI;

@end
