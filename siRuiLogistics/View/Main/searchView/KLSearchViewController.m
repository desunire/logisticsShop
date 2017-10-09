//
//  KLSearchViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSearchViewController.h"
#import "KLSearchListTableViewCell.h"
@interface KLSearchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,KLEmptyViewDelegate>


/**
 筛选视图
 */
@property(strong,nonatomic)KLFilterView *fliterView;


/**
 搜索按钮
 */
@property(strong,nonatomic)UIButton *searchBtn;

/**
 搜索框
 */
@property(strong,nonatomic)UISearchBar *searchBar;


/**
  当前tableView视图
 */
@property(strong,nonatomic)UITableView *tableView;


/**
 空视图
 */
@property(strong,nonatomic)KLEmptyView *emptyView;


@end

@implementation KLSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
//    [self addFilterView];
//    [self addTableView];
    [self setEmptyView:self.emptyView];
}


#pragma mark 设置空视图（搜索结果为空）
-(void)setEmptyView:(KLEmptyView *)emptyView{
    emptyView= [[KLEmptyView alloc] initWithFrame:self.view.frame andBackImage:@"noSearch" andMessage:@""];
    emptyView.delegate = self;
    [self.view addSubview:emptyView];
}

-(void)clickView{
    [self.searchBar resignFirstResponder];
}

#pragma mark --设置tableView
-(void)addTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.fliterView.frame.size.height+self.fliterView.frame.origin.y, SCREEN_WIDTH, SCREENH_HEIGHT - TabbarHeight - self.fliterView.frame.size.height) style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma mark - 导航栏
- (void)setUpNav
{
    self.searchBtn = [[UIButton alloc] initWithFrame:(CGRect){SCREEN_WIDTH - 40, 10, 45, 30}];
    [self.searchBtn setTitle:NSLocalizedString(@"search", nil) forState:UIControlStateNormal];
    [self.searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.searchBtn setBackgroundColor:DefaultBackColor];
    self.searchBtn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    [self.searchBtn addTarget:self action:@selector(getSearchResultBySearchText:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.searchBtn.layer.masksToBounds = YES;
    self.searchBtn.layer.cornerRadius = 5;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.searchBtn];
    
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = NSLocalizedString(@"searchPlaceholder", nil);
    self.searchBar.frame = CGRectMake(40, 25, SCREEN_WIDTH - 120, 35);
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
}

#pragma mark 点击键盘搜索按钮或者界面上的搜索按钮触发搜索事件

-(void)getSearchResultBySearchText:(NSString *)text{
    NSLog(@"%@",self.searchBar.text);
    [self.searchBar resignFirstResponder];
    //TODO:通过网络请求获取数据
}

#pragma mark 搜索框代理方法
//点击键盘上的search按钮时候调用
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
   
    [self getSearchResultBySearchText:searchBar.text];
}
//输入文本实时更新时调用
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}
//cancel按钮点击时调用
- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}
//点击搜索框时调用
//UISearchBarDelegate协议中定义的方法，当开始编辑时（搜索框成为第一响应者时）被调用。
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
//    searchBar.showsCancelButton =YES;
//    
//    [self customSearchBar];
    
}
//定制搜索框的取消按钮，纯粹是摸索出来的仅供参考。
- (void)customSearchBar
{
    for (UIView *view in [self.searchBar.subviews[0]subviews]) {
        if ([view isKindOfClass:UIButton.class]) {
            UIButton *button = (UIButton *)view;
            [button setTitle:@"取消"forState:UIControlStateNormal];
        }
    }
}
#pragma mark  增加筛选视图
-(void)addFilterView{
    
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

#pragma mark - 商品筛选
- (void)filtrateButtonClick
{
    [KLSildeBarView kl_showSlideBarViewController];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KLSearchListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchListCell"];
    if (cell ==  nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLSearchListTableViewCell class]) owner:self options:nil] firstObject];
    }
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}


@end
