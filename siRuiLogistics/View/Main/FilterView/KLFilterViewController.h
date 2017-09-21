//
//  KLFilterViewController.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLFilterViewController : UIViewController

/** 点击已选回调 */
@property (nonatomic , copy) void(^sureClickBlock)(NSArray *selectArray);

@end
