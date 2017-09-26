//
//  KLMessageStateView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/25.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^changeViewStateBlock)(BOOL);

@interface KLMessageStateView : UIView

+(instancetype)initView;

//当前试图是否被选择
@property(assign,nonatomic)BOOL isAllChoose;

@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;

- (IBAction)changeChooseState:(id)sender;

@property(copy,nonatomic)changeViewStateBlock block;

@end
