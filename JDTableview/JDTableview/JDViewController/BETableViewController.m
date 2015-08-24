//
//  BETableViewController.m
//  JDTableview
//
//  Created by ihefe26 on 15/8/24.
//  Copyright (c) 2015年 zhangliang. All rights reserved.
//

#import "BETableViewController.h"

@interface BETableViewController ()


@end

@implementation BETableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.BETableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30)];
    self.BETableView.backgroundColor = [UIColor lightGrayColor];
    _BETableView.delegate = self;
    _BETableView.dataSource = self;
    [self.view addSubview:_BETableView];
    
    self.dataArray = [NSMutableArray array];
    for (int i = 0; i < 10; i ++) {
        [_dataArray addObject:[NSString stringWithFormat:@"  菜单%d",i]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark tableviewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    cell.backgroundColor = [UIColor lightGrayColor];
    
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GetRowFromTableView" object:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    
}





@end
