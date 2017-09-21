//
//  KLScratchableLatexView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLScratchableLatexView.h"

@implementation KLScratchableLatexView


-(instancetype)initWithDataArr:(NSArray *)dataArr{
    if (self = [super init]) {
        
        
        self.dataArr = dataArr;
        
        //计算高度
        CGFloat height=proportion*(SCREEN_WIDTH-(JGGeftMargin+JGGeftMargin)*3)/3+2*JGGtopMargin;
        
        //计算行数
        long int number = dataArr.count / 3 + 1;
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, height*number);
        
        //设置视图
        for (int i = 0; i < dataArr.count; i++) {
            
            UIImageView *imageView = [[UIImageView alloc] init];
            
            imageView.image = [UIImage imageNamed:@"backInfo"];
            //图片宽高
            CGFloat imageWidth =(SCREEN_WIDTH-(JGGeftMargin+JGGeftMargin)*3)/3;
            CGFloat imageHeight = proportion*(SCREEN_WIDTH-(JGGeftMargin+JGGeftMargin)*3)/3;
            imageView.frame = CGRectMake(JGGeftMargin+i%3*SCREEN_WIDTH/3, JGGtopMargin+height*(i/3), imageWidth, imageHeight);
            
            [self addSubview:imageView];
            //图片增加点击事件
            
        }
        
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame andImageDataArr:(NSArray *)dataArr{
    
    if (self = [super initWithFrame:frame]) {
        self.dataArr = dataArr;
        //计算高度
        CGFloat height=proportion*(self.frame.size.width-(JGGeftMargin+JGGeftMargin)*3)/3+2*JGGtopMargin;
        //计算行数
        //long int number = dataArr.count / 3 + 1;
        //设置视图
        for (int i = 0; i < dataArr.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = [UIImage imageNamed:@"backInfo"];
            //图片宽高
            CGFloat imageWidth =(self.frame.size.width-(JGGeftMargin+JGGeftMargin)*3)/3;
            CGFloat imageHeight = proportion*(self.frame.size.width-(JGGeftMargin+JGGeftMargin)*3)/3;
            imageView.frame = CGRectMake(JGGeftMargin+i%3*self.frame.size.width/3, JGGtopMargin+height*(i/3), imageWidth, imageHeight);
            [self addSubview:imageView];
            //FIXED TODO
            //图片增加点击事件
            //图片绘制样式
        }
    }
    return self;
}



-(instancetype)initWithFrame:(CGRect)frame andBtnDataArr:(NSArray *)dataArr{
    
    if (self = [super initWithFrame:frame]) {
        self.dataArr = dataArr;
        //计算高度
        CGFloat height=30;
        //设置视图
        for (int i = 0; i < dataArr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = UIColorFromRGB(0xf2f2f2);
            btn.layer.cornerRadius = 5;
            btn.layer.masksToBounds = YES;
            [btn setTitle:[dataArr objectAtIndex:i] forState:UIControlStateNormal];
            //图片宽高
            CGFloat imageWidth =(self.frame.size.width-(JGGeftMargin+JGGeftMargin)*3)/3;
            btn.frame = CGRectMake(JGGeftMargin+i%3*self.frame.size.width/3, JGGtopMargin+(height+JGGtopMargin)*(i/3), imageWidth, height);
            [self addSubview:btn];
        }
    }
    return self;
}

//
//-(instancetype)initWithFrame:(CGRect)frame{
//    
//    if (self= [super initWithFrame:frame]) {
//        
//    }
//    return self;
//}

-(CGFloat)CaculateViewHeight{
    
    //计算高度
    CGFloat height=proportion*(SCREEN_WIDTH-(JGGeftMargin+JGGeftMargin)*3)/3+2*JGGtopMargin;
    
    //计算行数
    long int number = self.dataArr.count / 3 + 1;
    
    
    return height*number;
}

@end
