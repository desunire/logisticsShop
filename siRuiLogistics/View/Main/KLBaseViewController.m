//
//  KLBaseViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLBaseViewController.h"
#import "KLSearchViewController.h"
@interface KLBaseViewController ()<UITableViewDelegate,UITableViewDataSource,KLIndexSearchMessageChangeViewDelegate>
@end

@implementation KLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self initSearchView];
    [self initChangeLanguageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setChooseLanguage{
    //设置当前选中的语言
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"myLanguage"] && ![[[NSUserDefaults standardUserDefaults] objectForKey:@"myLanguage"] isEqualToString:@""]) {
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"myLanguage"] isEqualToString:@"en"]) {
            [self.indexSearchTopView.languageBtn setTitle:@"EN" forState:UIControlStateNormal];
        }
        
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"myLanguage"] isEqualToString:@"zh-Hans"]) {
            [self.indexSearchTopView.languageBtn setTitle:@"CN" forState:UIControlStateNormal];
        }
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"myLanguage"] isEqualToString:@"es"]) {
            [self.indexSearchTopView.languageBtn setTitle:@"ES" forState:UIControlStateNormal];
        }
        
    }
}

#pragma mark 设置上面的搜索视图
-(void)initSearchView{
    self.indexDefaultBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 60)];
    _indexDefaultBackView.backgroundColor = [UIColor whiteColor];
    _indexDefaultBackView.alpha = 0;
    self.indexDefaultBackView.hidden = YES;
    self.indexSearchTopView = [KLIndexSearchMessageChangeView initView];
    self.indexSearchTopView.frame = CGRectMake(0, 10, SCREEN_WIDTH, 60);
    self.indexSearchTopView.delegate = self;
    self.indexSearchTopView.state = NormalState;
    [self.view addSubview:self.indexDefaultBackView];
    [self.view addSubview:self.indexSearchTopView];
   
}

#pragma mark KLIndexSearchMessageChangeViewDelegate
-(void)gotoSearchView:(UISearchBar *)senderBar{
    
    KLSearchViewController *vc= [[KLSearchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    
}

-(void)gotoMessageViewByBtn:(UIButton *)senderBtn{
    
    KLMessageCenterViewController *vc= [[KLMessageCenterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    
}

#pragma mark 切换语言视图设置 KLIndexSearchMessageChangeViewDelegate
-(void)initChangeLanguageView{
    self.chooseLanguageView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLChooseLanguageView class]) owner:self options:nil] firstObject];
    self.chooseLanguageView.frame = CGRectMake(10, 70, self.chooseLanguageView.frame.size.width, self.chooseLanguageView.frame.size.height);
    self.chooseLanguageView.hidden = YES;
    //[self.view insertSubview:self.chooseLanguageView belowSubview:self.indexSearchTopView];
    [self.view addSubview:self.chooseLanguageView];
}


-(void)changeLangWithBtn:(UIButton *)senderBtn{
    if (self.indexSearchTopView.state == NormalState) {
        self.indexSearchTopView.state = ChooseLanguageState;
        self.chooseLanguageView.hidden = NO;
    }else{
        self.indexSearchTopView.state =NormalState;
        self.chooseLanguageView.hidden = YES;
    }
}

#pragma mark 初始化tableView
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
   // self.tableView.style =  UITableViewStylePlain;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    [self.view insertSubview:self.tableView belowSubview:backView];
}

#pragma mark tableView代理和数据源方法实现
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  0;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
}




@end
