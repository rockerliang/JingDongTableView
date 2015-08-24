//
//  BECollectionViewController.h
//  JDTableview
//
//  Created by ihefe26 on 15/8/24.
//  Copyright (c) 2015年 zhangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BETableViewController.h"

@interface BECollectionViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSInteger rowNum;
    NSInteger numberOfSections;
}

@property (strong, nonatomic) UICollectionView *BECollectionView;

@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong, nonatomic) NSMutableDictionary *moveDic;//纪录滚动到的位置


@end
