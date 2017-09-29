//
//  KLDetailShufflingHeadView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/25.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLDetailShufflingHeadView.h"

@interface KLDetailShufflingHeadView ()<SDCycleScrollViewDelegate>

/* 轮播图 */
@property (strong , nonatomic)SDCycleScrollView *cycleScrollView;

@end

@implementation KLDetailShufflingHeadView

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.dc_height) delegate:self placeholderImage:nil];
    _cycleScrollView.autoScroll = NO; // 不自动滚动
    _cycleScrollView.currentPageDotColor = DefaultBackColor;
    _cycleScrollView.pageDotColor = [UIColor whiteColor];
    [self addSubview:_cycleScrollView];
}

#pragma mark - 点击图片Bannar跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"点击了%zd轮播图",index);
    if (self.block) {
        self.block(index);
    }
}

#pragma mark - Setter Getter Methods
- (void)setShufflingArray:(NSArray *)shufflingArray
{
    _shufflingArray = shufflingArray;
    _cycleScrollView.imageURLStringsGroup = shufflingArray;
}



@end
