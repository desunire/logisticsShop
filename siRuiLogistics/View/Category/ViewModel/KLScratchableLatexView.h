//
//  KLScratchableLatexView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


static CGFloat JGGeftMargin = 10;

static CGFloat JGGitemMargin = 0;

static CGFloat JGGtopMargin = 10;

//static CGFloat viewHeight = 0.8*(SCREEN_WIDTH-(leftMargin+rightMargin)*3-2*itemMargin);

static CGFloat proportion = 0.8;

@interface KLScratchableLatexView : UIView

/**
  视图的数据来源 九宫格设计方案
 */
@property(strong,nonatomic)NSArray *dataArr;


//分类页面初始化cell 9九宫格全屏
-(instancetype)initWithDataArr:(NSArray *)dataArr;

//筛选页面初始化cell 9宫格button
-(instancetype)initWithFrame:(CGRect )frame andBtnDataArr:(NSArray *)dataArr;


//筛选页面初始化cell 9宫格Image
-(instancetype)initWithFrame:(CGRect )frame andImageDataArr:(NSArray *)dataArr;

-(CGFloat)CaculateViewHeight;

@end
