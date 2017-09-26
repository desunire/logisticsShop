//
//  KLAllChooseDelView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KLAllChooseDelViewDelegate <NSObject>

@optional
//改变状态--全选和取消全选
-(void)changeState:(BOOL)isAllChoose;

//删除
-(void)delData;

@end

@interface KLAllChooseDelView : UIView

//当前视图的状态
@property(assign,nonatomic)BOOL nowState;

@property (weak, nonatomic) IBOutlet UIButton *allChooseBtn;

@property(weak,nonatomic)id<KLAllChooseDelViewDelegate>delegate;

- (IBAction)chooseChangeBtn:(id)sender;
- (IBAction)delBtnClick:(id)sender;

+(instancetype)initView;

@end
