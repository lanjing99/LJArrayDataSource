//
//  LJViewController.m
//  LJArrayDataSource
//
//  Created by lanjing on 06/17/2016.
//  Copyright (c) 2016 lanjing. All rights reserved.
//

#import "LJViewController.h"
#import "LJArrayDataSource.h"

@interface LJViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataItems;

@property (nonatomic, strong) LJArrayDataSource *dataSource;

@end

@implementation LJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
	// Do any additional setup after loading the view, typically from a nib.
    
    for(int i = 0; i < 100; i++)
    {
        [self.dataItems addObject:@(i)];
    }
    self.dataSource = [[LJArrayDataSource alloc] initWithItems:self.dataItems cellIdentifier:@"cellID" configureCellBlock:^(id cell, id item) {
        UITableViewCell *tableViewCell = cell;
        tableViewCell.textLabel.text = [item description];
    }];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    self.tableView.dataSource = self.dataSource;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        [_tableView registerClass:<#(nullable Class)#> forCellReuseIdentifier:<#(nonnull NSString *)#>]
    }
    return _tableView;
}

-(NSMutableArray *)dataItems
{
    if(!_dataItems)
    {
        _dataItems = [NSMutableArray new];
    }
    return _dataItems;
}
@end
