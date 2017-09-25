//
//  KLFilterViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLFilterViewController.h"
#import "KLFilterTitleTableViewCell.h"
#import "KLFilterBrandTableViewCell.h"
#import "KLFilterCategoryTableViewCell.h"


static NSString *filterTitleCell = @"filterTitleCell";

static NSString *filterCateCell = @"filterCateCell";

static NSString *filterBrandCell = @"filterBrandCell";

@interface KLFilterViewController ()<UITableViewDataSource,UITableViewDelegate>

/* 筛选父View */
@property (strong , nonatomic)UIView *filtrateConView;

/**
 当前tableView视图
 */
@property(strong,nonatomic)UITableView *tableView;


/**
  分类选项
 */
@property(strong,nonatomic)NSArray *cateArr;


/**
 品牌选项
 */
@property(strong,nonatomic)NSArray *brandArr;

@end

@implementation KLFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cateArr = @[@"轮胎",@"轮胎1",@"轮胎2",@"轮胎3",@"轮胎4",@"轮胎5"];
    self.brandArr = @[@"轮胎",@"轮胎1",@"轮胎2",@"轮胎3",@"轮胎4",@"轮胎5",@"轮胎",@"轮胎1"];
    [self setUpInit];
    [self setUpBottomButton];
    [self addTableView];
    [self registerCell];
}

#pragma mark --设置tableView
-(void)addTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, FiltrateViewScreenW, SCREENH_HEIGHT - TabbarHeight - 60-40) style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma mark - initialize
- (void)setUpInit
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    _filtrateConView = [UIView new];
    _filtrateConView.backgroundColor = [UIColor whiteColor];
    _filtrateConView.frame = CGRectMake(0, 0, FiltrateViewScreenW, SCREENH_HEIGHT);
    [self.view addSubview:_filtrateConView];
    
    
}


#pragma mark - 底部重置确定按钮
- (void)setUpBottomButton
{
    CGFloat buttonW = FiltrateViewScreenW/2;
    CGFloat buttonH = 50;
    CGFloat buttonY = SCREENH_HEIGHT - buttonH;
    NSArray *titles = @[@"重置",@"确定"];
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.tag = i;
        if (i == 0) {
            [button setTitleColor:DefaultBackColor forState:UIControlStateNormal];
        }
        CGFloat buttonX = i*buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.titleLabel.font = PFR16Font;
        button.backgroundColor = (i == 0) ? UIColorFromRGB(0xfbe9e9) : DefaultBackColor;
        [button addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_filtrateConView addSubview:button];
    }
}

#pragma mark 注册cell
-(void)registerCell{
    
    [self.tableView registerClass:[KLFilterCategoryTableViewCell class] forCellReuseIdentifier:filterCateCell];
    [self.tableView registerClass:[KLFilterBrandTableViewCell class] forCellReuseIdentifier:filterBrandCell];
}

#pragma mark - 点击事件
- (void)bottomButtonClick:(UIButton *)button
{

    
}

#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            KLFilterTitleTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:filterTitleCell];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLFilterTitleTableViewCell class]) owner:self options:nil] firstObject];
            }
            return cell;
        }
        else{
            KLFilterCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:filterCateCell];
            if (cell == nil) {
                
                cell =[[KLFilterCategoryTableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:filterCateCell];
            }
            [cell setCellWithArr:self.cateArr];
            return cell;
        }
    }else{
        
        if (indexPath.row == 0) {
            KLFilterTitleTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:filterTitleCell];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLFilterTitleTableViewCell class]) owner:self options:nil] firstObject];
            }
            return cell;
        }
        else{
            KLFilterBrandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:filterBrandCell];
            if (cell == nil) {
                
                cell =[[KLFilterBrandTableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:filterBrandCell];
            }
            [cell setCellWithArr:self.brandArr];
            return cell;
        }
    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 40;
    }else{
        if (indexPath.section == 0) {
            //计算分类的高度
            //计算高度
            CGFloat height=30 + JGGtopMargin;//
            //计算行数
            long int number = self.cateArr.count / 3 ;
            if (self.cateArr.count%3 != 0) {
                number ++;
            }
            return height * number +10;
            
        }else{
            //计算品牌的高度
            //计算高度
            CGFloat height=proportion*(self.tableView.frame.size.width-(JGGeftMargin+JGGeftMargin)*3)/3+2*JGGtopMargin;
            //计算行数
            long int number = self.brandArr.count / 3 ;
            if (self.brandArr.count%3 != 0) {
                number ++;
            }
            return height * number +10;
        }
    }
    return 100;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
