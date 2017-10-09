//
//  KLProductModel.h
//  siRuiLogistics
//
//  Created by desunire on 2017/10/9.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLProductModel : NSObject


//商品详情

/**
 备注信息
 */
@property(copy,nonatomic)NSString *remarks;

/**
 商品信息id
 */
@property(copy,nonatomic)NSString *productInfoId;


/**
 所属销售公司id
 */
@property(copy,nonatomic)NSString *salesCompanyId;


/**
 所属销售片区id
 */
@property(copy,nonatomic)NSString *salesDistrictId;


/**
 货币单位
 */
@property(copy,nonatomic)NSString *priceUnit;


/**
 商品价格
 */
@property(copy,nonatomic)NSString *price;

/**
 最小订购量
 */
@property(copy,nonatomic)NSString *minOrderQuantity;


/**
 最大订购量
 */
@property(copy,nonatomic)NSString *maxOrderQuantity;


/**
 商品所在厂库id
 */
@property(copy,nonatomic)NSString *repositoryId;


/**
 安全库存
 */
@property(copy,nonatomic)NSString *safeStock;

@property(copy,nonatomic)NSString *

@property(copy,nonatomic)NSString *

@property(copy,nonatomic)NSString *

@property(copy,nonatomic)NSString *

@end
