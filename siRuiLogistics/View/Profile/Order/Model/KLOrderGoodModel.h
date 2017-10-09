//
//  KLOrderGoodModel.h
//  siRuiLogistics
//
//  Created by desunire on 2017/10/9.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLOrderGoodModel : NSObject

//订单商品详情


/**
 商品图片
 */
@property(copy,nonatomic)NSString *goodImage;

/**
 商品名称
 */
@property(copy,nonatomic)NSString *goodName;

/**
 商品价格
 */
@property(copy,nonatomic)NSString *goodPrice;

/**
 商品购买下单数
 */
@property(copy,nonatomic)NSString *goodNumber;


@end
