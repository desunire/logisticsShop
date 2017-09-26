//
//  KLOrderStateView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KLOrderStateViewDelegate <NSObject>


@optional
-(void)changeViewWithTag:(NSInteger)index;

@end


@interface KLOrderStateView : UIView


@property(weak,nonatomic)id<KLOrderStateViewDelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame andChooseIndex:(int)index;

@end
