//
//  BECollectionViewController.m
//  JDTableview
//
//  Created by ihefe26 on 15/8/24.
//  Copyright (c) 2015年 zhangliang. All rights reserved.
//

#import "BECollectionViewController.h"

@interface BECollectionViewController ()

@end

@implementation BECollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    numberOfSections = 11;
    self.view.backgroundColor =[UIColor whiteColor];
    rowNum = 0;
    self.moveDic = [NSMutableDictionary dictionary];
    for (int i = 0; i < numberOfSections ; i ++) {
        [self.moveDic setValue:@"0" forKey:[NSString stringWithFormat:@"%d",i]];
    }
    UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc] init];
    self.BECollectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 90, self.view.frame.size.height - 30) collectionViewLayout:flowLayout];
    _BECollectionView.backgroundColor = [UIColor whiteColor];
    _BECollectionView.delegate = self;
    _BECollectionView.dataSource = self;
    [self.view addSubview:_BECollectionView];
    
    [self.BECollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    //注册headerView Nib的view需要继承UICollectionReusableView
    [self.BECollectionView registerNib:[UINib nibWithNibName:@"SQSupplementaryView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UITableViewHearderView"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetRowFromTableView:) name:@"GetRowFromTableView" object:nil];
}

-(void)GetRowFromTableView:(NSNotification *)cence
{
    rowNum = [cence.object integerValue];
    [self.BECollectionView reloadData];
    float y = [[_moveDic objectForKey:[NSString stringWithFormat:@"%ld",(long)rowNum]] floatValue];
    [self.BECollectionView setContentOffset:CGPointMake(0, y) animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveMovePoint:(float)y
{
    [_moveDic setValue:[NSString stringWithFormat:@"%f",y] forKey:[NSString stringWithFormat:@"%ld",(long)rowNum]];
}

#pragma -mark UICollectionViewDelegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return numberOfSections;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section%2 == 0)
    {
        return 12;
    }else
    {
        return 1;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    for(UIView *subView in self.view.subviews)
    {
        if([subView.class isSubclassOfClass:[UIImageView class]])
        {
            [subView removeFromSuperview];
        }
    }

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageView.image = [UIImage imageNamed:@"tempShop"];
    [cell addSubview:imageView];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(50, 50);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 15, 15,30);
}
//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    NSString *reuseIdentifier = @"UITableViewHearderView";
   
    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[view viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%ld头菜单%ld",rowNum,(long)indexPath.section];
    return view;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={320,45};
    return size;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%f",scrollView.contentOffset.y);
    [self saveMovePoint:scrollView.contentOffset.y];
}

@end
