//
//  KLOrderListTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLOrderListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *delBtn;
- (IBAction)delOrderBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *orderStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeOrderTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *goodPicImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeGoodPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeGoodNumberLabel;

@end
