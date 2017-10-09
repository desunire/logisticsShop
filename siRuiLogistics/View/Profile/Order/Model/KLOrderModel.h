//
//  KLOrderModel.h
//  siRuiLogistics
//
//  Created by desunire on 2017/10/9.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLOrderModel : NSObject

//订单模型 -- 下单时间，订单状态， 订单商品列表

/**
 下单时间
 */
@property(copy,nonatomic)NSString *orderTime;


/**
 订单状态
 */
@property(copy,nonatomic)NSString *orderState;


/**
 订单中商品购买列表
 */
@property(strong,nonatomic)NSArray *orderGoodList;

@end
