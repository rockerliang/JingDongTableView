//
//  BETableViewController.h
//  JDTableview
//
//  Created by ihefe26 on 15/8/24.
//  Copyright (c) 2015年 zhangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BETableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *BETableView;

@property (strong, nonatomic) NSMutableArray *dataArray;



@end
