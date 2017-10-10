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



/**
 总库存
 */
@property(copy,nonatomic)NSString *totalStock;


/**
 未发货库存
 */
@property(copy,nonatomic)NSString *unshippedStock;


/**
 折扣
 */
@property(copy,nonatomic)NSString *discount;


/**
 促销价格
 */
@property(copy,nonatomic)NSString *promotionPrice;

/**
 是否可预订
 */
@property(copy,nonatomic)NSString *allowOrder;

/**
状态：1，正常 2，低于安全库存 3，缺货
 */
@property(copy,nonatomic)NSString *status;

/**
促销开始时间
 */
@property(copy,nonatomic)NSString *promotionBegin;

/**
促销结束时间
 */
@property(copy,nonatomic)NSString *promotionEnd;


@end
