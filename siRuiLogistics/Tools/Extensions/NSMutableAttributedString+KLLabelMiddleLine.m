//
//  NSMutableAttributedString+KLLabelMiddleLine.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/29.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "NSMutableAttributedString+KLLabelMiddleLine.h"

@implementation NSMutableAttributedString (KLLabelMiddleLine)

+(instancetype)getMiddleLabelAttributeWithText:(NSString *)text andLineColor:(UIColor *)ForlineColor{
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:text attributes:attribtDic];
    return attribtStr;
}

@end
