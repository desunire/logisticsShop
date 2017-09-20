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
        CGFloat height=proportion*(SCREEN_WIDTH-(leftMargin+leftMargin)*3)/3+2*topMargin;
        
        //计算行数
        long int number = dataArr.count / 3 + 1;
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, height*number);
        
        //设置视图
        for (int i = 0; i < dataArr.count; i++) {
            
            UIImageView *imageView = [[UIImageView alloc] init];
            
            imageView.image = [UIImage imageNamed:@"backInfo"];
            //图片宽高
            CGFloat imageWidth =(SCREEN_WIDTH-(leftMargin+leftMargin)*3)/3;
            CGFloat imageHeight = proportion*(SCREEN_WIDTH-(leftMargin+leftMargin)*3)/3;
            imageView.frame = CGRectMake(leftMargin+i%3*SCREEN_WIDTH/3, topMargin+height*(i/3), imageWidth, imageHeight);
            
            [self addSubview:imageView];
            //图片增加点击事件
            
        }
        
        
    }
    return self;
}


-(CGFloat)CaculateViewHeight{
    
    //计算高度
    CGFloat height=proportion*(SCREEN_WIDTH-(leftMargin+leftMargin)*3)/3+2*topMargin;
    
    //计算行数
    long int number = self.dataArr.count / 3 + 1;
    
    
    return height*number;
}

@end
