//
//  KLTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
@interface KLScrollTableViewCell : UITableViewCell<SDCycleScrollViewDelegate>

@property(strong,nonatomic)NSArray *imagesURLStrings;


-(void)setCellWithModel:(NSArray *)imagesURLArr;

@end
