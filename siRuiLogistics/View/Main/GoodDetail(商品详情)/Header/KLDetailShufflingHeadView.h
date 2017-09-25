//
//  KLDetailShufflingHeadView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/25.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^BigImageShowBlock)(NSInteger);

@interface KLDetailShufflingHeadView : UICollectionReusableView

/** 轮播数组 */
@property (nonatomic, copy) NSArray *shufflingArray;

@property(copy,nonatomic)BigImageShowBlock block;

@end
