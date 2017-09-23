//
//  KLSildeBarView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSildeBarView.h"
#import "KLFilterViewController.h"


#define AnimatorDuration  0.25

@interface KLSildeBarView()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIView *coverView;//遮罩
@property (nonatomic,strong) KLFilterViewController *filterView;//筛选视图

@end


@implementation KLSildeBarView

+(void)kl_showSlideBarViewController{
    
    KLSildeBarView *obj = [[KLSildeBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
    
    [KEYWINDOW addSubview:obj];
}


//重写init
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpBaseSetting];
    }
    return self;
}

#pragma mark - 初始化设置
- (void)setUpBaseSetting
{
    [self addSubViews];
    
    [self addGestureRecognizer];
}


#pragma mark - LazyLaod
- (UIView *)coverView{
    if (!_coverView) {
        _coverView = [[UIView alloc]initWithFrame:self.bounds];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.0;
    }
    return _coverView;
}

- (KLFilterViewController *)filterView{
    if (!_filterView) {
        _filterView = [[KLFilterViewController alloc]init];
        _filterView.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH * 0.8, SCREENH_HEIGHT);
    }
    return _filterView;
}

#pragma mark - 添加SubViews
- (void)addSubViews{
    
    [self addSubview:self.coverView];
    [self addSubview:self.filterView.view];
    
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:AnimatorDuration animations:^{
        weakSelf.coverView.alpha = 0.4;
        weakSelf.filterView.view.dc_x = SCREEN_WIDTH * 0.2;
    }];
    
    self.filterView.sureClickBlock = ^(NSArray *selectArray) { //在筛选情况下的确定回调
        [weakSelf tapEvent];
    };
    
}


#pragma mark - 添加手势和监听
- (void)addGestureRecognizer
{
    //添加手势
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panEvent:)]; //滑动
    pan.delegate = self;
    [self addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapEvent)];
    [self.coverView addGestureRecognizer:tap]; //点击
    
    //添加“frame”监听
    [self.filterView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

#pragma mark - private Methods
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"frame"]) {
        CGRect new = [change[@"new"] CGRectValue];
        CGFloat x = new.origin.x;
        if (x < SCREEN_WIDTH) {
            self.coverView.alpha = 0.4 * (1-x / SCREEN_WIDTH) + 0.1;
        }else{
            self.coverView.alpha = 0.0;
        }
    }
}

#pragma mark - 滑动手势事件
- (void)panEvent:(UIPanGestureRecognizer *)recognizer{
    
    CGPoint translation = [recognizer translationInView:self];
    
    NSLog(@"%.2f,%.2f",translation.x,translation.y);
    
    if(UIGestureRecognizerStateBegan == recognizer.state || UIGestureRecognizerStateChanged == recognizer.state){
        
        if (translation.x > 0 ) {//右滑
            self.filterView.view.dc_x = SCREEN_WIDTH * 0.2 + translation.x;
        }else{//左滑
            
            if (self.filterView.view.dc_x < SCREEN_WIDTH * 0.2) {
                self.filterView.view.dc_x = self.filterView.view.dc_x - translation.x;
            }else{
                self.filterView.view.dc_x = SCREEN_WIDTH * 0.2;
            }
        }
    }else{
        
        [self tapEvent];
    }
}
#pragma mark - 点击手势事件
- (void)tapEvent{
    
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:AnimatorDuration animations:^{
        weakSelf.coverView.alpha = 0.0;
        weakSelf.filterView.view.dc_x = SCREEN_WIDTH;
    } completion:^(BOOL finished) {
        
        [weakSelf removeAllSubviews];
        [weakSelf removeFromSuperview];
    }];
}

#pragma mark - 移除SubViews
- (void)removeAllSubviews {
    
    if (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}


#pragma mark - 销毁
- (void)dealloc{
    //移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.filterView removeObserver:self forKeyPath:@"frame"];
}
@end
