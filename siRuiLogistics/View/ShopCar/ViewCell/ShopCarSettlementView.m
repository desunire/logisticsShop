//
//  ShopCarSettlementView.m
//  phoenix
//
//  Created by mac on 16/10/31.
//  Copyright © 2016年 desunire. All rights reserved.
//

#import "ShopCarSettlementView.h"

@implementation ShopCarSettlementView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        self.layer.borderWidth=0.5;
        self.layer.borderColor=UIColorFromRGB(0xf2f2f2).CGColor;
        self.backgroundColor=UIColorFromRGB(0xffffff);
        self.allChooseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.allChooseBtn setImage:[UIImage imageNamed:@"icon10"] forState:UIControlStateNormal];
        self.allChooseBtn.selected=NO;
        [self.allChooseBtn addTarget:self action:@selector(allChoose:) forControlEvents:UIControlEventTouchUpInside];
        self.priceLabel=[UILabel setMyLabel:showFont andColor:showTextColor andTextAlignment:NSTextAlignmentLeft];
        
         self.allChooseLabel=[UILabel setMyLabel:showFont andColor:showTextColor andTextAlignment:NSTextAlignmentLeft];
        self.allChooseLabel.text = totalText;
        
        
        self.priceLabel.text=totalPriceText;
        self.priceLabel.textAlignment = NSTextAlignmentRight;
        
        self.settlementBtn=[UIButton setBtnWithTitle:NSLocalizedString(@"jiesuan", nil) andFont:BigshowFont andTitleColor:UIColorFromRGB(0xffffff)];
        self.settlementBtn.backgroundColor=OperateBtnBackColor;
        [self.settlementBtn addTarget:self action:@selector(gotoSubmitOrder:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.allChooseBtn];
        [self addSubview:self.priceLabel];
        [self addSubview:self.settlementBtn];
        [self addSubview:self.allChooseLabel];
        [self.allChooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
            make.top.equalTo(self.mas_top).offset((self.frame.size.height-20)/2);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        [self.allChooseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.allChooseBtn.mas_right).offset(5);
            make.top.equalTo(self.mas_top).offset((self.frame.size.height-20)/2);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-100-40, 20));
        }];
        
        
         
         [self.settlementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.right.equalTo(self.mas_right).offset(0);
             make.top.equalTo(self.mas_top).offset(0);
             make.size.mas_equalTo(CGSizeMake(100, self.frame.size.height));
         }];
        
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.settlementBtn.mas_left).offset(-10);
            make.top.equalTo(self.mas_top).offset((self.frame.size.height-20)/2);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-100-40, 20));
        }];
        /*
         NSKeyValueObservingOptionNew：当options中包括了这个参数的时候，观察者收到的change参数中就会包含NSKeyValueChangeNewKey和它对应的值，也就是说，观察者可以得知这个property在被改变之后的新值。
         NSKeyValueObservingOptionOld：和NSKeyValueObservingOptionNew的意思类似，当包含了这个参数的时候，观察者收到的change参数中就会包含NSKeyValueChangeOldKey和它对应的值。
         NSKeyValueObservingOptionInitial：当包含这个参数的时候，在addObserver的这个过程中，就会有一个notification被发送到观察者那里，反之则没有--会执行- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context;。
         NSKeyValueObservingOptionPrior：当包含这个参数的时候，在被观察的property的值改变前和改变后，系统各会给观察者发送一个change notification；在property的值改变之前发送的change notification中，change参数会包含NSKeyValueChangeNotificationIsPriorKey并且值为@YES，但不会包含NSKeyValueChangeNewKey和它对应的值。
       */
        [self addObserver:self forKeyPath:@"shopcarOperateState" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
    }
    return self;
}



/**
 监听属性变化
 @param keyPath <#keyPath description#>
 @param object <#object description#>
 @param change <#change description#>
 @param context <#context description#>
 NSKeyValueChangeKindKey：这是change中永远会包含的键值对，它的值时一个NSNumber对象，具体的数值有NSKeyValueChangeSetting、NSKeyValueChangeInsertion、NSKeyValueChangeRemoval、NSKeyValueChangeReplacement这几个，其中后三个是针对于to-many relationship的。
 
 NSKeyValueChangeNewKey：只有当addObserver的时候在optional参数中加入NSKeyValueObservingOptionNew，这个键值对才会被change参数包含；它表示这个property改变后的新值。
 
 NSKeyValueChangeNewOld：只有当addObserver的时候在optional参数中加入NSKeyValueObservingOptionOld，这个键值对才会被change参数包含；它表示这个property改变前的值。
 
 NSKeyValueChangeIndexesKey：当被观察的property是一个ordered to-many relationship时，这个键值对才会被change参数包含；它的值是一个NSIndexSet对象。
 
 NSKeyValueChangeNotificationIsPriorKey：只有当addObserver的时候在optional参数中加入NSKeyValueObservingOptionPrior，这个键值对才会被change参数包含；它的值是@YES
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@,%@,%@,%@",keyPath,object,change,context);
    //判断状态是否发生变化
    if ([change jsonString:@"old"] && [change jsonString:@"new"] ) {
        if (![[change jsonString:@"old"] isEqualToString:[change jsonString:@"new"]]) {
            //获取新的状态--改变UI
            if ([[change jsonString:@"new"] integerValue] == normalState) {
                [self.settlementBtn setTitle:NSLocalizedString(@"jiesuan", nil) forState:UIControlStateNormal];
                 self.priceLabel.hidden = NO;
            }else if([[change jsonString:@"new"] integerValue] == editState) {
                [self.settlementBtn setTitle:NSLocalizedString(@"delete", nil) forState:UIControlStateNormal];
                self.priceLabel.hidden = YES;
            }
        }
    }
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"shopcarOperateState"];
}

-(void)gotoSubmitOrder:(id)sender{
    
    if (self.shopcarOperateState == normalState) {
        if ([self.delegate respondsToSelector:@selector(gotoPay)]) {
            [self.delegate gotoPay];
        }
    }
    else{
        if ([self.delegate respondsToSelector:@selector(delete:)]) {
            [self.delegate delete:nil];
        }
    }
    
}


-(void)allChoose:(UIButton *)sender{
    
    if (sender.selected) {
        
        sender.selected=NO;
        [self.allChooseBtn setImage:[UIImage imageNamed:@"icon10"] forState:UIControlStateNormal];
        if ([self.delegate respondsToSelector:@selector(cancelChooseAll)]) {
            [self.delegate cancelChooseAll];
        }
    }
    
    else{
        sender.selected=YES;
        [self.allChooseBtn setImage:[UIImage imageNamed:@"icon9"] forState:UIControlStateNormal];
        if ([self.delegate respondsToSelector:@selector(chooseAll)]) {
             [self.delegate chooseAll];
        }
    }
    
}


-(void)setViewWithIsAllChoose:(BOOL)flag andPrice:(NSString *)priceInfo andChooseNum:(NSInteger)number{
    
    
    if (flag) {
        
         [self.allChooseBtn setImage:[UIImage imageNamed:@"icon10"] forState:UIControlStateNormal];
    }
    else{
         [self.allChooseBtn setImage:[UIImage imageNamed:@"icon9"] forState:UIControlStateNormal];
    }
    
    self.priceLabel.text=priceInfo;
    [self.settlementBtn setTitle:[NSString stringWithFormat:@"%@ (%ld)",NSLocalizedString(@"jiesuan", nil),number] forState:UIControlStateNormal];
    
}

@end
