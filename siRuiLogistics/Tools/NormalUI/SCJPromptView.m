//
//  SCJPromptView.m
//  phoenix
//
//  Created by mac on 16/11/3.
//  Copyright © 2016年 desunire. All rights reserved.
//

#import "SCJPromptView.h"

@implementation SCJPromptView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
       
        [self addSubview:self.effectview];
        
        [self addSubview:self.backView];
    }
    
    return  self;
    
    
}

-(void)setViewWithTitle:(NSString *)title andMessge:(NSString *)message andCancelTitle:(NSString *)cancel andSureTitle:(NSString *)sure{
    
    if (!KlStringisEmpty(title)) {
        self.titleLabel=[UILabel setMyLabel:[UIFont boldSystemFontOfSize:18.0] andColor:[UIColor blackColor] andTextAlignment:NSTextAlignmentCenter];
        self.titleLabel.text=title;
        [self.backView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backView.mas_top).offset(20);
            make.left.equalTo(self.backView.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-leftDistance*2, 20));
        }];
    }
    
    if (!KlStringisEmpty(message)) {
        
        self.messageLabel=[UILabel setMyLabel:[UIFont systemFontOfSize:17.0] andColor:[UIColor blackColor] andTextAlignment:NSTextAlignmentCenter];
        self.messageLabel.numberOfLines=0;
        self.messageLabel.textColor=UIColorFromRGB(0x333333);
        self.messageLabel.text=message;
        [self.backView addSubview:self.messageLabel];
        [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backView.mas_top).offset(40);
            make.left.equalTo(self.backView.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-leftDistance*2, 40));
        }];
        
    }
    
    if (!KlStringisEmpty(cancel)) {
        
        self.cancelBtn=[UIButton setBtnWithTitle:cancel andFont:[UIFont boldSystemFontOfSize:15.0] andTitleColor:UIColorFromRGB(0x333333)];
        
        self.cancelBtn.layer.borderWidth=0.5;
        
        self.cancelBtn.layer.borderColor=UIColorFromRGB(0xcccccc).CGColor;
        
        [self.backView addSubview:self.cancelBtn];
        
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.backView.mas_left).offset(0);
            
            make.bottom.equalTo(self.backView.mas_bottom).offset(0);
            
            make.size.mas_equalTo(CGSizeMake(0.5*(SCREEN_WIDTH-leftDistance*2), btnHeight));
        }];
        
        [self.cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    if (!KlStringisEmpty(sure)) {
        
        self.sureBtn=[UIButton setBtnWithTitle:sure andFont:[UIFont boldSystemFontOfSize:15.0] andTitleColor:UIColorFromRGB(0xffffff)];
        
        self.sureBtn.backgroundColor=DefaultBackColor;
        
       self.sureBtn.layer.borderWidth=0.5;
        
        self.sureBtn.layer.borderColor=UIColorFromRGB(0xcccccc).CGColor;
        
        [self.backView addSubview:self.sureBtn];
        
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.backView.mas_right).offset(0);
            make.bottom.equalTo(self.backView.mas_bottom).offset(0);
            make.size.mas_equalTo(CGSizeMake(0.5*(SCREEN_WIDTH-leftDistance*2), btnHeight));
        }];
        
        [self.sureBtn addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}


-(void)cancel:(id)sender{
    
    if ([self.delegate respondsToSelector:@selector(chooseItem:)]) {
        
        [self.delegate chooseItem:0];
    }
    
}


-(void)sure:(id)sender{
    
    if ([self.delegate respondsToSelector:@selector(chooseItem:)]) {
        
        [self.delegate chooseItem:1];
    }
}

-(UIView *)backView{
    
    if (!_backView) {
        _backView=[[UIView alloc]init];
        _backView.frame=CGRectMake(leftDistance, (SCREENH_HEIGHT-backViewHeight)/2, SCREEN_WIDTH-leftDistance*2, backViewHeight);
        _backView.backgroundColor=UIColorFromRGB(0xffffff);
        _backView.layer.cornerRadius=10;
        _backView.layer.masksToBounds=YES;
    }
    return _backView;
    
}

-(UIView *)effectview{
    
    if (!_effectview) {
        _effectview=[[UIView alloc]init];
        _effectview.frame=self.bounds;
        _effectview.backgroundColor=[UIColor blackColor];
        _effectview.alpha=0.4;
     }
    return _effectview;
    
}


@end
