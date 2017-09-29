//
//  KLGoodSpecCollectionViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/25.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLGoodSpecCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *goodSalePriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *chooseNumberBtn;
@property (weak, nonatomic) IBOutlet UILabel *goodPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodBrandLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodModelLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodStoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodOriginPriceLabel;

@end
