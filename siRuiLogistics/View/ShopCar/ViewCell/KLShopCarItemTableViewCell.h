//
//  KLShopCarItemTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLShopCarItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *chooseImageView;
@property (weak, nonatomic) IBOutlet UIImageView *goodImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodName;
@property (weak, nonatomic) IBOutlet UILabel *goodPriceDes;
- (IBAction)reduceNumClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *numberBtn;
- (IBAction)addNumberClick:(id)sender;

@end
