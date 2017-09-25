//
//  KLGoodViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/22.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLGoodViewController.h"
#import "KLDetailShufflingHeadView.h"
#import "KLGoodNameCollectionViewCell.h"
#import "KLGoodSpecCollectionViewCell.h"
#import "KLGoodDescCollectionViewCell.h"
#import "KLBigImgShowViewController.h"
/***
 自定义cell的标志
 */
static NSString *groupCell = @"groupCell";

static NSString *goodHeadPicCell = @"goodHeadPicCell";

static NSString *goodNameCell = @"goodNameCell";

static NSString *goodSpecCell = @"goodSpecCell";

static NSString *goodDesCell = @"goodDesCell";

@interface KLGoodViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
/**
  商品介绍采用流式布局
 */
@property(strong,nonatomic)UICollectionView *collectionView;

/* 滚回顶部按钮 */
@property (strong , nonatomic)UIButton *backTopButton;

@end

@implementation KLGoodViewController

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 0; //Y
        layout.minimumInteritemSpacing = 0; //X
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREENH_HEIGHT- 64 - 50);
        _collectionView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_collectionView];
        
        //注册header
        [_collectionView registerClass:[KLDetailShufflingHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:goodHeadPicCell];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:groupCell];//间隔
        //注册Cell
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([KLGoodNameCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:goodNameCell];
        
         [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([KLGoodSpecCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:goodSpecCell];
        
         [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([KLGoodDescCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:goodDesCell];
//        //注册Footer
//        [_collectionView registerClass:[DCDetailOverFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCDetailOverFooterViewID];
//        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter"]; //间隔
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = self.view.backgroundColor;
    [self setUpSuspendView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -大图预览
-(void)bigImgShow{
    
    KLBigImgShowViewController *vc=[[UIStoryboard storyboardWithName:@"KLBigImgShowViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"KLBigImgShowViewController"];
    //[[KLBigImgShowViewController alloc] initWithNibName:NSStringFromClass([KLBigImgShowViewController class]) bundle:[NSBundle bundleWithIdentifier:@"KLBigImgShowViewController"]];
    //[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"123"];
   // vc.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT);
   // [self.view addSubview:vc.view];
    [self.navigationController pushViewController:vc animated:NO];
    
}


#pragma mark - 悬浮按钮
- (void)setUpSuspendView
{
    _backTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_backTopButton];
    [_backTopButton addTarget:self action:@selector(ScrollToTop) forControlEvents:UIControlEventTouchUpInside];
    [_backTopButton setImage:[UIImage imageNamed:@"btn_UpToTop"] forState:UIControlStateNormal];
    _backTopButton.hidden = YES;
    _backTopButton.frame = CGRectMake(SCREEN_WIDTH - 50, SCREENH_HEIGHT - 100, 40, 40);
}

#pragma mark - collectionView滚回顶部
- (void)ScrollToTop
{
        __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.collectionView.contentOffset = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [weakSelf.collectionView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
        }];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //判断回到顶部按钮是否隐藏
    NSLog(@"%.2f>>%.2f",scrollView.contentOffset.y,SCREENH_HEIGHT);
    _backTopButton.hidden = (scrollView.contentOffset.y > SCREENH_HEIGHT*0.5-50) ? NO : YES;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return (section == 0) ? CGSizeMake(SCREEN_WIDTH, SCREENH_HEIGHT * 0.5):CGSizeMake(SCREEN_WIDTH, 10);

}


#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) { //商品名称
        return CGSizeMake(SCREEN_WIDTH, 50);
    }else if (indexPath.section == 1) { //商品规格
        return CGSizeMake(SCREEN_WIDTH,160);
    }else if (indexPath.section == 2) { //商品文字描述
        return CGSizeMake(SCREEN_WIDTH,[DCSpeedy dc_calculateTextSizeWithText:@"京东价：京东价为商品的销售价，是您最终决定是否购买商品的依据。划线价：商品展示的划横线价格为参考价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或该商品在京东平台上曾经展示过的销售价；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。折扣：如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。异常问题：商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询" WithTextFont:16 WithMaxW:SCREEN_WIDTH - 20].height+10);
    }else{
        return CGSizeZero;
    }
}


#pragma mark - <UICollectionViewDataSource> <UICollectionViewDelegate>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 1;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *resultCell = nil;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            KLGoodNameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:goodNameCell forIndexPath:indexPath];
            cell.nameLabel.text = @"这是一个商品商品这是一个商品商品这是一个商品商品这是一个商品商品";
            resultCell = cell;
        }
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            KLGoodSpecCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:goodSpecCell forIndexPath:indexPath];
            resultCell = cell;
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            KLGoodDescCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:goodDesCell forIndexPath:indexPath];
            resultCell = cell;
        }
    }
    return resultCell;
}




-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    __weak KLGoodViewController *wself  = self;
    
    if (kind == UICollectionElementKindSectionHeader) {
        if (indexPath.section == 0) {
            KLDetailShufflingHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:goodHeadPicCell forIndexPath:indexPath];
            headView.shufflingArray = @[@"http://gfs14.gomein.net.cn/T1bSxTBjEb1RCvBVdK_400.jpg",@"http://gfs.gomein.net.cn/T1WkxTB7Dv1RCvBVdK_400.jpg"];
            headView.block = ^(NSInteger index){
                [wself bigImgShow];
                NSLog(@"%ld大图预览",index);
            };
            reusableView = headView;
        }
        else{
            UICollectionReusableView *groupView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:groupCell forIndexPath:indexPath];;
            groupView.backgroundColor = UIColorFromRGB(0xf5f5f5);
            reusableView = groupView;
        }
    }
    return reusableView;
    
}


@end
