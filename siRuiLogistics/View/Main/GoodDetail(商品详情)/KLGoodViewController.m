//
//  KLGoodViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/22.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLGoodViewController.h"


/***
 自定义cell的标志
 */

static NSString *goodHeadPicCell = @"goodHeadPicCell";

static NSString *goodNameCell = @"goodNameCell";

static NSString *goodSpecCell = @"goodSpecCell";

static NSString *goodDesCell = @"goodDesCell";

@interface KLGoodViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
/**
  商品介绍采用流式布局
 */
@property(strong,nonatomic)UICollectionView *collectionView;

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
       // _collectionView.frame = CGRectMake(0, DCTopNavH, ScreenW, ScreenH - DCTopNavH - 50);
        _collectionView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_collectionView];
        
//        //注册header
//        [_collectionView registerClass:[DCDetailShufflingHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCDetailShufflingHeadViewID];
//        [_collectionView registerClass:[DCDeatilCustomHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCDeatilCustomHeadViewID];
//        //注册Cell
//        [_collectionView registerClass:[DCDetailGoodReferralCell class] forCellWithReuseIdentifier:DCDetailGoodReferralCellID];
//        [_collectionView registerClass:[DCShowTypeOneCell class] forCellWithReuseIdentifier:DCShowTypeOneCellID];
//        [_collectionView registerClass:[DCShowTypeTwoCell class] forCellWithReuseIdentifier:DCShowTypeTwoCellID];
//        [_collectionView registerClass:[DCShowTypeThreeCell class] forCellWithReuseIdentifier:DCShowTypeThreeCellID];
//        [_collectionView registerClass:[DCShowTypeFourCell class] forCellWithReuseIdentifier:DCShowTypeFourCellID];
//        [_collectionView registerClass:[DCDetailLikeCell class] forCellWithReuseIdentifier:DCDetailLikeCellID];
//        [_collectionView registerClass:[DCDetailPartCommentCell class] forCellWithReuseIdentifier:DCDetailPartCommentCellID];
//        [_collectionView registerClass:[DCDetailServicetCell class] forCellWithReuseIdentifier:DCDetailServicetCellID];
//        //注册Footer
//        [_collectionView registerClass:[DCDetailOverFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCDetailOverFooterViewID];
//        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter"]; //间隔
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
