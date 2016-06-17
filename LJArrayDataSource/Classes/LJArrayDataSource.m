//
//  LJArrayDataSource.m
//  LJArrayDataSource
//
//  Created by lanjing on 6/17/16.
//  Copyright © 2016 lanjing. All rights reserved.
//

#import "LJArrayDataSource.h"

@interface LJArrayDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy)   LJTableViewCellConfigureBlock cellConfigBlock;
@property (nonatomic, copy, readonly)   NSString *cellIdentifier;

@end

@implementation LJArrayDataSource

//MARK: life cycle
-(instancetype)init
{
    NSCAssert(0, @"use initWithItems:cellIdentifier:configureCellBlock: instead");
    return nil;
}

-(instancetype)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(LJTableViewCellConfigureBlock)aConfigureCellBlock
{
    if(self = [super init])
    {
        _items = anItems;
        _cellConfigBlock = [aConfigureCellBlock copy];
        _cellIdentifier = [aCellIdentifier copy];
    }
    return self;
}

//MARK: public methods

-(id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    NSCAssert(index >= 0 && index < self.items.count, @"indexPath out of range");
    
    return self.items[index];
}

//MARK: UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    self.cellConfigBlock(cell, [self itemAtIndexPath:indexPath]);
    return cell;
}

//MARK: UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    self.cellConfigBlock(cell, [self itemAtIndexPath:indexPath]);
    return cell;
}

@end
