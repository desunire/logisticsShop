//
//  KLChangePwdView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KLChangePwddViewDelegate <NSObject>


@optional

-(void)changePwdWithOldPwd:(NSString *)oldPWd andNewPwd:(NSString *)newString andSurepwd:(NSString *)surePwd;


@end

@interface KLChangePwddView : UIView
@property (weak, nonatomic) IBOutlet UITextField *oldPwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *nnewTextField;
@property (weak, nonatomic) IBOutlet UITextField *surePwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;


@property(weak,nonatomic)id<KLChangePwddViewDelegate>delegate;

- (IBAction)sureBtnClick:(id)sender;

+(instancetype)initView;

-(void)setUI;

@end
