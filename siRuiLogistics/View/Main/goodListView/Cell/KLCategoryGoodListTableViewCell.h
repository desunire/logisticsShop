//
//  KLCategoryGoodListTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLCategoryGoodListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *goodImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodOriginPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *shopCarBtn;
- (IBAction)gotoShopCart:(id)sender;

@end
