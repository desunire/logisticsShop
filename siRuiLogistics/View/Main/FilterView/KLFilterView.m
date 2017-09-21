//
//  KLFilterView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLFilterView.h"
#import "KLFilterButton.h"
#import "DCSpeedy.h"
#define AuxiliaryNum 100

@interface KLFilterView()

/** 记录上一次选中的Button */
@property (nonatomic , weak)KLFilterButton *selectBtn;
/** 记录上一次选中的Button底部View */
@property (nonatomic , strong)UIView *selectBottomRedView;

@end


@implementation KLFilterView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.priceBtnClickNum = 0;
        [self setUI];
    }
    return self;
}


-(void)setUI{
    
    self.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[NSLocalizedString(@"sale", nil),NSLocalizedString(@"price", nil),NSLocalizedString(@"filter", nil)];
    
    NSArray *noImage =  @[@"",@"order_default",@"screening"];
    
    CGFloat btnW = self.dc_width / titles.count;
    CGFloat btnH = self.dc_height;
    CGFloat btnY = 0;
    for (NSInteger i = 0; i < titles.count; i++) {
        KLFilterButton *button = [KLFilterButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [self addSubview:button];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:noImage[i]] forState:UIControlStateNormal];
        button.tag = i + AuxiliaryNum;
        CGFloat btnX = i * btnW;
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 2) {
           [button setTitleColor:DefaultBackColor forState:UIControlStateNormal];
        }
        self.isChooseSale = false;//默认初始化没有选中销量
    }
     [DCSpeedy dc_setUpAcrossPartingLineWith:self WithColor:[[UIColor lightGrayColor]colorWithAlphaComponent:0.4]];
    
}


#pragma mark - 按钮点击
- (void)buttonClick:(KLFilterButton *)button
{
    if (button.tag == 2 + AuxiliaryNum) { //筛选
        !_filtrateClickBlock ? : _filtrateClickBlock();
    }else if(button.tag == 1 + AuxiliaryNum){//价格 -- 无 ，从高到底 ，从低到高
        self.priceBtnClickNum ++;
        if (self.priceBtnClickNum % 3 == unClick) {
            [button setImage:[UIImage imageNamed:@"order_default"] forState:UIControlStateNormal];
            if (self.priceBlock) {
                self.priceBlock(unClick);
            }
            _selectBtn = button;
            [_selectBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        }
        if (self.priceBtnClickNum % 3 == UpToLow) {
            [button setImage:[UIImage imageNamed:@"order_up"] forState:UIControlStateNormal];
            if (self.priceBlock) {
                self.priceBlock(UpToLow);
            }
            [_selectBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            _selectBtn = button;
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        if (self.priceBtnClickNum % 3 == lowToUp) {
            [button setImage:[UIImage imageNamed:@"order_down"] forState:UIControlStateNormal];
            if (self.priceBlock) {
                self.priceBlock(lowToUp);
            }
            [_selectBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            _selectBtn = button;
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        
    }
    else{
        //选中了销量
//        _selectBottomRedView.hidden = YES;
//        [_selectBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.isChooseSale = ! self.isChooseSale;
        [_selectBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        if (self.isChooseSale) {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }else{
            [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        }
        _selectBtn = button;
    }
}


@end
