//
//  KLgoodListViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLgoodListViewController.h"
#import "KLCategoryGoodListTableViewCell.h"

static NSString *cateGoodListCell = @"cateGoodListCell";

@interface KLgoodListViewController ()<UITableViewDelegate,UITableViewDataSource>


/**
 筛选视图
 */
@property(strong,nonatomic)KLFilterView *fliterView;

/**
 当前tableView视图
 */
@property(strong,nonatomic)UITableView *tableView;

/**
 搜索按钮
 */
@property(strong,nonatomic)UIButton *searchBtn;

/**
 搜索框
 */
@property(strong,nonatomic)UISearchBar *searchBar;


@end

@implementation KLgoodListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setUpNav];
    [self addTableView];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --设置tableView
-(void)addTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.fliterView.frame.size.height+self.fliterView.frame.origin.y, SCREEN_WIDTH, SCREENH_HEIGHT - TabbarHeight - self.fliterView.frame.size.height) style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma mark 设置UI
-(void)setUI{
    
    
    self.fliterView = [[KLFilterView alloc] initWithFrame:CGRectMake(0, 44+20, SCREEN_WIDTH, 50)];
    __weak typeof(self)weakSelf = self;
    
    
    self.fliterView.filtrateClickBlock = ^{
        [weakSelf filtrateButtonClick];
    };
    self.fliterView.priceBlock= ^(priceBtnClickState flag){
        
        if (flag == unClick) {
            NSLog(@"正常");
        }
        if (flag == UpToLow) {
            NSLog(@"从高到低");
        }
        if (flag == lowToUp) {
            NSLog(@"从低到高");
        }
        
    };
    [self.view addSubview:self.fliterView];
    
    
}


#pragma mark - 导航栏
- (void)setUpNav
{
    self.searchBtn = [[UIButton alloc] initWithFrame:(CGRect){SCREEN_WIDTH - 40, 10, 35, 20}];
    [self.searchBtn setTitle:NSLocalizedString(@"search", nil) forState:UIControlStateNormal];
    
    [self.searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.searchBtn setBackgroundColor:DefaultBackColor];
    
    self.searchBtn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    self.searchBtn.layer.masksToBounds = YES;
    self.searchBtn.layer.cornerRadius = 5;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.searchBtn];
    
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = NSLocalizedString(@"searchPlaceholder", nil);
    self.searchBar.frame = CGRectMake(40, 25, SCREEN_WIDTH - 120, 35);
    self.navigationItem.titleView = self.searchBar;
}

#pragma mark - 商品筛选
- (void)filtrateButtonClick
{
    [KLSildeBarView kl_showSlideBarViewController];
}


#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KLCategoryGoodListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cateGoodListCell];
    if (cell ==  nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLCategoryGoodListTableViewCell class]) owner:self options:nil] firstObject];
    }
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    KLGoodBaseViewController *vc= [[KLGoodBaseViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    
}


@end
