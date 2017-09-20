//
//  KLIndexViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLIndexViewController.h"
#import "KLCategoryObject.h"
#import "KLCategoryItemButton.h"
#import "KLSubtitleAndMoreTableViewCell.h"
#import "KLGoodListTableViewCell.h"
#import "KLSalePromotionTableViewCell.h"
#import "KLIndexSearchMessageChangeView.h"
// 轮播图cell
static NSString *scrollPicCell  =  @"scrollCell";
//分类cell
static NSString *categoryItemCell = @"categoryCell";
//标题cell
static NSString *titleCell = @"titleCell";
//商品listCell
static NSString *goodListCell = @"goodListCell";
//推广低价Cell
static NSString *promotionCell = @"promotionCell";

@interface KLIndexViewController ()<UITableViewDataSource,UITableViewDelegate,KLIndexSearchMessageChangeViewDelegate>

@property(strong,nonatomic)UIView *test;

/**
  分类子项标题
 */
@property(strong,nonatomic)NSArray *categoryItemArr;

/**
  热卖好货列表数据源
 */
@property(strong,nonatomic)NSMutableArray *goodsListArr;


@end

@implementation KLIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor cz_randomColor];
    
    self.indexDefaultBackView.hidden =NO;
    self.indexSearchTopView.backgroundColor = [UIColor clearColor];
    [self registCell];
    [self setChooseLanguage];
    self.chooseLanguageView.index = 0;
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionInitial context:nil];
    
    
    KLCategoryObject *model1 = [KLCategoryObject new];
    model1.picDesc = @"轮胎";
    model1.urlPic = @"xxx";
    
    KLCategoryObject *model2 = [KLCategoryObject new];
    model2.picDesc = @"轮胎1";
    model2.urlPic = @"xxx";
    
    KLCategoryObject *model3 = [KLCategoryObject new];
    model3.picDesc = @"轮胎2";
    model3.urlPic = @"xxx";
    
    KLCategoryObject *model4 = [KLCategoryObject new];
    model4.picDesc = @"轮胎3";
    model4.urlPic = @"xxx";
    
    KLCategoryObject *model5 = [KLCategoryObject new];
    model5.picDesc = @"轮胎4";
    model5.urlPic = @"xxx";
    
    
    KLCategoryObject *model6 = [KLCategoryObject new];
    model6.picDesc = @"轮胎5";
    model6.urlPic = @"xxx";
    
    KLCategoryObject *model7 = [KLCategoryObject new];
    model7.picDesc = @"轮胎6";
    model7.urlPic = @"xxx";
    
    KLCategoryObject *model8 = [KLCategoryObject new];
    model8.picDesc = nil;
    model8.urlPic = @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg";
    
    
    self.categoryItemArr = @[model1,model2,model3,model4,model5,model6,model7,model8];
    
    self.goodsListArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",nil];
    
   // self.tableView.style = UITableViewStylePlain ;
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
#pragma mark KLIndexSearchMessageChangeViewDelegate
//-(void)gotoMessageViewByBtn:(UIButton *)senderBtn{
//    
//}
//
//-(void)changeLangWithBtn:(UIButton *)senderBtn{
//    [senderBtn setTitle:@"EN" forState:UIControlStateNormal];
//}

//-(void)gotoSearchView:(UISearchBar *)senderBar{
//    NSLog(@"搜索。。");
//    senderBar.text = @"我被点击了";
//    [senderBar resignFirstResponder];
//}

#pragma mark  内存管理
-(void)dealloc{
    
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UItableView注册cell
-(void)registCell{
     [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
     [self.tableView registerClass:[KLScrollTableViewCell class] forCellReuseIdentifier:scrollPicCell];
    [self.tableView registerClass:[KLCategoryItemTableViewCell class] forCellReuseIdentifier:categoryItemCell];
    [self.tableView registerClass:[KLSubtitleAndMoreTableViewCell class] forCellReuseIdentifier:titleCell];
    [self.tableView registerClass:[KLGoodListTableViewCell class] forCellReuseIdentifier:goodListCell];
    [self.tableView registerClass:[KLSalePromotionTableViewCell class] forCellReuseIdentifier:promotionCell];
}

#pragma mark 监听tablView的滑动距离
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    //NSLog(@"%.2f>>%.2f",self.tableView.contentOffset.y,self.tableView.contentInset.top);
    if (self.tableView.contentOffset.y>0) {
        CGFloat alpha = self.tableView.contentOffset.y/50.0;
        self.indexDefaultBackView.alpha =(alpha < 1.0 ?alpha:1.0);
        if (self.indexDefaultBackView.alpha == 1) {
            [self.indexSearchTopView.languageBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }
    }else{
         [self.indexSearchTopView.languageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    
    
    
}
#pragma mark tableView代理和数据源方法实现
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  4;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 3) {
        return self.goodsListArr.count+1;
    }
    if (section == 2) {
        return  1+1;
    }
    return 1;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        KLScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:scrollPicCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[KLScrollTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:scrollPicCell];
        }
        [cell setCellWithModel:nil];
        return cell;
    }else if(indexPath.section == 1){
        KLCategoryItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryItemCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[KLCategoryItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:categoryItemCell];
        }
        [cell setCellWithModelArr:self.categoryItemArr];
        return cell;
    }else if(indexPath.section == 3){
        if (indexPath.row == 0) {
            KLSubtitleAndMoreTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLSubtitleAndMoreTableViewCell class]) owner:self options:nil] firstObject];
            if (cell == nil) {
                cell = [[KLSubtitleAndMoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:categoryItemCell];
            }
            return cell;
        }else{
            KLGoodListTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLGoodListTableViewCell class]) owner:self options:nil] firstObject];
            if (cell == nil) {
                cell = [[KLGoodListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:goodListCell];
            }
            return cell;
        }
    }
    else if(indexPath.section == 2){
        if (indexPath.row == 0) {
            KLSubtitleAndMoreTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLSubtitleAndMoreTableViewCell class]) owner:self options:nil] firstObject];
            if (cell == nil) {
                cell = [[KLSubtitleAndMoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:categoryItemCell];
            }
            return cell;
        }else{
            KLSalePromotionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:promotionCell forIndexPath:indexPath] ;
            if (cell == nil) {
                cell = [[KLSalePromotionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:goodListCell];
            }
            [cell setCellWithPromotionArr:self.goodsListArr];
            return cell;
        }
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.contentView.backgroundColor = [UIColor cz_randomColor];
        return cell;
    }
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 200;
    }if (indexPath.section == 1) {
        //计算分类视图的高度
        CGFloat width = SCREEN_WIDTH/4;
        CGFloat picWidth = width-leftMargin-rightMargin;
        CGFloat height = picWidth+topMargin+belowMargin+titleHeight;
        return self.categoryItemArr.count/4*height;
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            return 44;
        }else{
            return 200;
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 44;
        }else{
            return cellHeight*2;
        }
    }
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
