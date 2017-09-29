//
//  KLCategoryViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLCategoryViewController.h"
#import "KLIndexSearchMessageChangeView.h"
#import "KLCategoryTitleTableViewCell.h"
#import "KLCategoryContentTableViewCell.h"
#import "KLScratchableLatexView.h"


static NSString *categoryContentCell = @"categoryContentCell";

static NSString *categoryTitleCell = @"categoryTitle";


@interface KLCategoryViewController ()<KLIndexSearchMessageChangeViewDelegate,UITableViewDelegate,UITableViewDataSource>

/**
 搜索和切换语言，查看消息的视图
 */
//@property(strong,nonatomic)KLIndexSearchMessageChangeView *indexSearchTopView;


/**
 数据源
 */
@property(strong,nonatomic)NSArray *dataArr;


/**
 切换语言视图
 */
//@property(strong,nonatomic)KLChooseLanguageView *chooseLanguageView;

@end

@implementation KLCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor cz_randomColor];
    self.navigationController.navigationBar.hidden = YES;
    [self setChooseLanguage];
    self.chooseLanguageView.index = 1;
    self.tableView.frame = CGRectMake(0, 40, SCREEN_WIDTH, SCREENH_HEIGHT-self.tabBarController.tabBar.frame.size.height);
    self.dataArr =  @[@"1",@"1",@"1",@"1",@"1",@"1",@"1"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UIColorFromRGB(0xf1f1f1);
    [self.indexSearchTopView.languageBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark 切换语言视图设置 KLIndexSearchMessageChangeViewDelegate
-(void)initChangeLanguageView{
    self.chooseLanguageView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLChooseLanguageView class]) owner:self options:nil] firstObject];
    self.chooseLanguageView.frame = CGRectMake(10, 60, self.chooseLanguageView.frame.size.width, self.chooseLanguageView.frame.size.height);
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


#pragma mark 注册cell
-(void)registerCell{
    
    [self.tableView registerClass:[KLCategoryContentTableViewCell class] forCellReuseIdentifier:categoryContentCell];
}
#pragma mark 设置上面的搜索视图 -- 不需要重写父类方法
//-(void)initSearchView{
//     self.indexSearchTopView = [KLIndexSearchMessageChangeView initView];
//    self.indexSearchTopView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60);
//    self.indexSearchTopView.delegate = self;
//    self.indexSearchTopView.state = NormalState;
//    [self.view addSubview:self.indexSearchTopView];
//}




#pragma mark UITableViewDelegate,UITableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return 50;
    }
    else{
        //计算高度
        CGFloat height=0.8*(SCREEN_WIDTH-(JGGeftMargin+JGGeftMargin)*3)/3+2*JGGtopMargin;
         //计算行数
        long int number = self.dataArr.count / 3;
        if (self.dataArr.count%3 != 0) {
            number ++;
        }
        return height*number;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        KLCategoryTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryTitleCell];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLCategoryTitleTableViewCell class]) owner:self options:nil] firstObject];
        }
        return cell;
    }
    else{
        
        KLCategoryContentTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:categoryContentCell];
        if (cell ==nil) {
            cell = [[KLCategoryContentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:categoryContentCell];
            
        }
        [cell setCellWithArr:self.dataArr];
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 10;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //self.chooseLanguageView.hidden = YES;
}


@end
