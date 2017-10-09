//
//  KLOrderViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLOrderViewController.h"
#import "KLOrderStateView.h"
#import "KLAllOrderViewController.h"
#import "KLWaitSendViewController.h"
#import "KLWaitSureViewController.h"


static float topViewHeight = 50;

@interface KLOrderViewController ()<UIScrollViewDelegate,KLOrderStateViewDelegate>

//订单头部视图
@property(strong,nonatomic)KLOrderStateView *orderTopView;

/**
 界面切换视图
 */
@property (strong, nonatomic) UIScrollView *scrollerView;


/** 记录上一次选中的Button */
@property (nonatomic , weak) UIButton *selectBtn;

/* 标题按钮地下的指示器 */
@property (weak ,nonatomic) UIView *indicatorView;




@end

@implementation KLOrderViewController

#pragma mark 懒加载控件
- (UIScrollView *)scrollerView
{
    if (!_scrollerView) {
        _scrollerView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        _scrollerView.frame = self.view.bounds;
        _scrollerView.showsVerticalScrollIndicator = NO;
        _scrollerView.showsHorizontalScrollIndicator = NO;
        _scrollerView.pagingEnabled = YES;
        _scrollerView.bounces = NO;
        _scrollerView.delegate = self;
        [self.view addSubview:_scrollerView];
    }
    return _scrollerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:@"订单"];
    [self setUpChildViewControllers];
    [self setUpInit];
    [self addTopView];
    [self addChildViewController];
}



#pragma mark 设置界面UI
- (void)setUpInit
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollerView.backgroundColor = self.view.backgroundColor;
    self.scrollerView.contentSize = CGSizeMake(self.view.dc_width * self.childViewControllers.count, 0);
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark 设置订单视图头部view
-(void)addTopView{
    self.orderTopView = [[KLOrderStateView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, topViewHeight) andChooseIndex:self.nowOrderState];
    self.orderTopView.delegate = self;
    [self.view addSubview:self.orderTopView];
    
    KLFilterButton *firstButton = self.orderTopView.subviews[self.nowOrderState];
    [self topBottonClick:firstButton]; //选中的按钮
    
    UIView *indicatorView = [[UIView alloc]init];
    self.indicatorView = indicatorView;
    indicatorView.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    
    indicatorView.dc_height = 2;
    indicatorView.dc_y = self.orderTopView.dc_height - indicatorView.dc_height;
    
    [firstButton.titleLabel sizeToFit];
    indicatorView.dc_width = SCREEN_WIDTH/3;
    indicatorView.dc_centerX = firstButton.dc_centerX;
    
    [self.orderTopView addSubview:indicatorView];

}

#pragma mark 头部视图代理方法
-(void)changeViewWithTag:(NSInteger)index{
    
    KLFilterButton *firstButton = self.orderTopView.subviews[index];
    [self topBottonClick:firstButton]; //切换按钮
    
}
//添加子控制器
-(void)setUpChildViewControllers
{
    //__weak typeof(self)weakSelf = self;
    KLAllOrderViewController *avc=[[KLAllOrderViewController alloc] init];
    [self addChildViewController:avc];
    
    KLWaitSendViewController *sVc=[[KLWaitSendViewController alloc] init];
    [self addChildViewController:sVc];
    
    
    KLWaitSureViewController *uVc=[[KLWaitSureViewController alloc] init];
    [self addChildViewController:uVc];
    
    
}
//添加子控制器View
-(void)addChildViewController
{
    NSInteger index = _scrollerView.contentOffset.x / _scrollerView.dc_width;
    UIViewController *childVc = self.childViewControllers[index];
    
    if (childVc.view.superview) return; //判断添加就不用再添加了
    childVc.view.frame = CGRectMake(index * _scrollerView.dc_width, topViewHeight+64, _scrollerView.dc_width, _scrollerView.dc_height);
    [_scrollerView addSubview:childVc.view];
    
}
#pragma mark - 头部按钮点击
- (void)topBottonClick:(KLFilterButton *)button
{
    button.selected = !button.selected;
    [_selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:DefaultBackColor forState:UIControlStateNormal];
    
    _selectBtn = button;
    
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.indicatorView.dc_width = SCREEN_WIDTH/3;
        weakSelf.indicatorView.dc_centerX = button.dc_centerX;
    }];
    
    CGPoint offset = _scrollerView.contentOffset;
    offset.x = _scrollerView.dc_width * button.tag;
    [_scrollerView setContentOffset:offset animated:YES];
}



#pragma mark - <UIScrollViewDelegate>
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildViewController];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.dc_width;
    KLFilterButton *button = self.orderTopView.subviews[index];
    [self topBottonClick:button];
    [self addChildViewController];
    
}

@end
