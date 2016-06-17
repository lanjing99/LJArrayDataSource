//
//  LJArrayDataSource.h
//  LJArrayDataSource
//
//  Created by lanjing on 6/17/16.
//  Copyright © 2016 lanjing. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^LJTableViewCellConfigureBlock)(id cell, id item);


@interface LJArrayDataSource : NSObject <UITableViewDataSource, UICollectionViewDataSource>

- (instancetype)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(LJTableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end