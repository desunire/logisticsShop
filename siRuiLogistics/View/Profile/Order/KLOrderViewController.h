//
//  KLOrderViewController.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLOrderViewController : UIViewController

//当前进入的订单选项 0-全部 1-待确认 2-待发货
@property(assign,nonatomic)int nowOrderState;

@end
