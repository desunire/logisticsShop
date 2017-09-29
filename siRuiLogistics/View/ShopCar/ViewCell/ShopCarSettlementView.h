//
//  ShopCarSettlementView.h
//  phoenix
//
//  Created by mac on 16/10/31.
//  Copyright © 2016年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    normalState,//正常状态0
    editState,//编辑状态1
 } shopcarState;


//显示合计字体大小
#define showFont  [UIFont systemFontOfSize:14.0]

#define BigshowFont  [UIFont systemFontOfSize:16.0]

#define showTextColor  UIColorFromRGB(0x5B5B5B)

#define OperateBtnBackColor  UIColorFromRGB(0xbb1e10)

#define totalText  NSLocalizedString(@"allChoose", nil)

#define totalPriceText  [NSString stringWithFormat:@"%@:￥0",NSLocalizedString(@"heji", nil)] 


/**
 代理协议
 */
@protocol ShopCarSettlementViewDelegate <NSObject>
@optional
//去支付
-(void)gotoPay;
//全选
-(void)chooseAll;
//取消全选
-(void)cancelChooseAll;
//删除
-(void)delete:(id)object;
@end




@interface ShopCarSettlementView : UIView


/**
 当前购物车状态
 */
@property(assign,nonatomic)shopcarState shopcarOperateState;

//结算
@property(strong,nonatomic)UIButton *settlementBtn;

//全选按钮
@property(strong,nonatomic)UIButton *allChooseBtn;

//实际付款,合计金额
@property(strong,nonatomic)UILabel *priceLabel;

//全选显示
@property(strong,nonatomic)UILabel *allChooseLabel;


// 需要绑定一个购物车的模型  模型变化，视图变化;

@property(weak,nonatomic)id<ShopCarSettlementViewDelegate>delegate;

-(void)setViewWithIsAllChoose:(BOOL)flag andPrice:(NSString *)priceInfo andChooseNum:(NSInteger)number;

@end
