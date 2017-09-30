//
//  KLGoodBaseViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/22.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLGoodBaseViewController.h"
#import "KLGoodViewController.h"
#import "KLDetailViewController.h"
#import "KLBigImgShowViewController.h"
#import "KLShopCarViewController.h"
@interface KLGoodBaseViewController ()<UIScrollViewDelegate>
/**
 界面切换视图
 */
@property (strong, nonatomic) UIScrollView *scrollerView;

/**
 上面顶部视图-- 商品和详情
 */
@property (strong, nonatomic) UIView *bgView;

/** 记录上一次选中的Button */
@property (nonatomic , weak) UIButton *selectBtn;

/* 标题按钮地下的指示器 */
@property (weak ,nonatomic) UIView *indicatorView;

/* 通知 */
@property (weak ,nonatomic) id dcObserve;


@end

@implementation KLGoodBaseViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewControllers];
    [self setUpInit];//先初始化scrollView
    [self addChildViewController];
    [self setUpNav];
    [self setUpTopButtonView];
    [self setUpRightTwoButton];
}


#pragma mark - 头部View
- (void)setUpTopButtonView
{
    NSArray *titles = @[NSLocalizedString(@"goods", nil),NSLocalizedString(@"detail", nil)];
    CGFloat margin = 5;
    _bgView = [[UIView alloc] init];
    _bgView.dc_centerX = SCREEN_WIDTH * 0.5;
    _bgView.dc_height = 44;
    _bgView.dc_width = (64 + margin) * titles.count;
    _bgView.dc_y = 0;
    self.navigationItem.titleView = _bgView;
    
    CGFloat buttonW = 64;
    CGFloat buttonH = _bgView.dc_height;
    CGFloat buttonY = _bgView.dc_y;
    for (NSInteger i = 0; i < titles.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:0];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.tag = i;
        button.titleLabel.font = PFR16Font;
        [button addTarget:self action:@selector(topBottonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonX = i * (buttonW + margin);
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        [_bgView addSubview:button];
        
    }
    
    UIButton *firstButton = _bgView.subviews[0];
    [self topBottonClick:firstButton]; //默认选择第一个
    
    UIView *indicatorView = [[UIView alloc]init];
    self.indicatorView = indicatorView;
    indicatorView.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    
    indicatorView.dc_height = 2;
    indicatorView.dc_y = _bgView.dc_height - indicatorView.dc_height;
    
    [firstButton.titleLabel sizeToFit];
    indicatorView.dc_width = firstButton.titleLabel.dc_width;
    indicatorView.dc_centerX = firstButton.dc_centerX;
    
    [_bgView addSubview:indicatorView];
    
}

#pragma mark - 头部按钮点击
- (void)topBottonClick:(UIButton *)button
{
    button.selected = !button.selected;
    [_selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:DefaultBackColor forState:UIControlStateNormal];
    
    _selectBtn = button;
    
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.indicatorView.dc_width = button.titleLabel.dc_width;
        weakSelf.indicatorView.dc_centerX = button.dc_centerX;
    }];
    
    CGPoint offset = _scrollerView.contentOffset;
    offset.x = _scrollerView.dc_width * button.tag;
    [_scrollerView setContentOffset:offset animated:YES];
}

#pragma mark - 导航栏设置
- (void)setUpNav
{
    UIBarButtonItem *careItem = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"careAbout"] WithHighlighted:[UIImage imageNamed:@"careAbout"] Target:self action:@selector(careAbout)];
    
    UIBarButtonItem *shopcarItem = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"goods_shopcar"] WithHighlighted:[UIImage imageNamed:@"goods_shopcar_red"] Target:self action:@selector(shopCarClick)];
    
    self.navigationItem.rightBarButtonItems = @[shopcarItem,careItem];
    
}

//收藏
-(void)careAbout{
    NSLog(@"收藏");
}

-(void)shopCarClick{
    NSLog(@"购物车");
    KLShopCarViewController *vc = [[KLShopCarViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

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

#pragma mark 设置界面UI
- (void)setUpInit
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollerView.backgroundColor = self.view.backgroundColor;
    self.scrollerView.contentSize = CGSizeMake(self.view.dc_width * self.childViewControllers.count, 0);
    self.automaticallyAdjustsScrollViewInsets = NO;
}
#pragma mark - 加入购物车 立即购买
- (void)setUpRightTwoButton
{
    NSArray *titles = @[NSLocalizedString(@"addCart", nil),NSLocalizedString(@"buyNow", nil)];
    CGFloat buttonW = SCREEN_WIDTH * 0.5;
    CGFloat buttonH = 50;
    CGFloat buttonY = SCREENH_HEIGHT - buttonH;
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.tag = i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.backgroundColor = (i == 0) ? [UIColor orangeColor] : DefaultBackColor;
        [button addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonX = (buttonW * i);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [self.view addSubview:button];
    }
}
//点击加入购物车和立即购买按钮发送通知，在子控制器中处理
- (void)bottomButtonClick:(UIButton *)button
{
        //父控制器的加入购物车和立即购买
        //异步发通知
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%zd",button.tag],@"buttonTag", nil];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ClickAddOrBuy" object:nil userInfo:dict];
        });
}

//添加子控制器
-(void)setUpChildViewControllers
{
    //__weak typeof(self)weakSelf = self;
    KLGoodViewController *gVc=[[KLGoodViewController alloc] init];
    [self addChildViewController:gVc];
    
    KLDetailViewController *dVc1= [[KLDetailViewController alloc] init];
    [self addChildViewController:dVc1];
    

    
}
//添加子控制器View
-(void)addChildViewController
{
    NSInteger index = _scrollerView.contentOffset.x / _scrollerView.dc_width;
    UIViewController *childVc = self.childViewControllers[index];
    
    if (childVc.view.superview) return; //判断添加就不用再添加了
    childVc.view.frame = CGRectMake(index * _scrollerView.dc_width, 0, _scrollerView.dc_width, _scrollerView.dc_height);
    [_scrollerView addSubview:childVc.view];
    
}


#pragma mark - <UIScrollViewDelegate>
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildViewController];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.dc_width;
    UIButton *button = _bgView.subviews[index];
    [self topBottonClick:button];
    [self addChildViewController];

}


@end
