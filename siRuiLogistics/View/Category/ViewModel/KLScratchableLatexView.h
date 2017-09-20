//
//  KLScratchableLatexView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


static CGFloat leftMargin = 10;

static CGFloat itemMargin = 0;

static CGFloat topMargin = 10;

//static CGFloat viewHeight = 0.8*(SCREEN_WIDTH-(leftMargin+rightMargin)*3-2*itemMargin);

static CGFloat proportion = 0.8;

@interface KLScratchableLatexView : UIView

/**
  视图的数据来源 九宫格设计方案
 */
@property(strong,nonatomic)NSArray *dataArr;


-(instancetype)initWithDataArr:(NSArray *)dataArr;


-(CGFloat)CaculateViewHeight;

@end
