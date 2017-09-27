//
//  KLSubmitOrderView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/27.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KLSubmitViewDelegate <NSObject>

@optional

-(void)submitOrder;


@end

@interface KLSubmitView : UIView

@property(weak,nonatomic)id<KLSubmitViewDelegate>delagete;


@property (weak, nonatomic) IBOutlet UILabel *totalPricelabel;

- (IBAction)submitBtnClick:(id)sender;

+(instancetype)initView;

@end
