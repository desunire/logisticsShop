//
//  UILabel+CZAddition.m
//
//  Created by 刘凡 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UILabel+CZAddition.h"

@implementation UILabel (CZAddition)

+ (instancetype)cz_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color {
    UILabel *label = [[self alloc] init];
    
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    label.numberOfLines = 0;
    
    [label sizeToFit];
    
    return label;
}
+(UILabel *)setMyLabel:(UIFont *)font andColor:(UIColor *)color andTextAlignment:(NSTextAlignment)textAlignment{
    UILabel *label=[[UILabel alloc]init];
    label.font=font;
    label.textColor=color;
    label.textAlignment=textAlignment;
    return label;
    
}



//单行获取
-(CGSize)getSize:(CGSize)size andFont:(UIFont *)font andText:(NSString *)str{
    NSDictionary *attributes1 = @{NSFontAttributeName:font,
                                  NSForegroundColorAttributeName:[UIColor blackColor]
                                  };
    CGSize titleSize = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes1 context:nil].size;
    CGSize resultSize=CGSizeMake(titleSize.width+5, titleSize.height);
    return resultSize;
    
}

//多行获取
-(CGSize)getmultSize:(CGSize)size andFont:(UIFont *)font andText:(NSString *)str{
    
    NSDictionary *attributes1 = @{NSFontAttributeName:font,
                                  NSForegroundColorAttributeName:[UIColor blackColor]
                                  };
    self.numberOfLines = 0;//多行显示，计算高度
    CGSize titleSize = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes1 context:nil].size;
    return titleSize;
}

//添加中划线
+(void)setMiddleLineWithText:(NSString *)text andForegroundColor:(UIColor *)ForegroundColor WithLabel:(UILabel *)label{
//    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
//       NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:text attributes:attribtDic];
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:label.text attributes:attribtDic];
      label.attributedText =attribtStr;
}

//添加下划线
-(NSMutableAttributedString *)setBottomLineWithText:(NSString *)text andForegroundColor:(UIColor *)ForegroundColor{
    // 下划线 NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]}; NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
    
   return nil;
}

@end
