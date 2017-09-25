//
//  KLNavTitleView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/25.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLNavTitleView.h"

@implementation KLNavTitleView

-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title{
    
    if (self = [super initWithFrame:frame]) {
        UILabel *titlelabel = [[UILabel alloc] initWithFrame:frame];
        titlelabel.text =title;
        titlelabel.textAlignment = NSTextAlignmentCenter;
        titlelabel.textColor = DefaultBackColor;
       // [titlelabel sizeToFit];
        [self addSubview:titlelabel];
    }
    return self;
}

//让navigationItem  的titleView居中显示；
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.center = CGPointMake(self.superview.center.x, self.center.y);
}

@end
