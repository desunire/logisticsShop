//
//  KLGoodCollectView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLGoodCollectView : UIView

+(instancetype)initView;

@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

@property (weak, nonatomic) IBOutlet UIImageView *goodImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodOriginPriceLabel;

//当前视图绑定的对象
@property(copy,nonatomic)NSString *good;

@end
