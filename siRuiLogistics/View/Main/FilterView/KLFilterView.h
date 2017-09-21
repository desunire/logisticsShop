//
//  KLFilterView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    unClick,
    UpToLow,
    lowToUp,
} priceBtnClickState;

typedef void(^priceClickBlock)(priceBtnClickState);

@interface KLFilterView : UIView

@property(assign,nonatomic)int priceBtnClickNum;

/** 筛选点击回调 */
@property (nonatomic, copy) dispatch_block_t filtrateClickBlock;

/** 价格点击回调 */
@property (nonatomic, copy) priceClickBlock priceBlock;


/**
 是否选中了销量
 */
@property(nonatomic,assign)BOOL isChooseSale;

@end
