//
//  ZYGGCommonTableViewCell.h
//  ZYGGSplitTableView
//
//  Created by admin on 2018/11/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZYGGCommonTableRow;

@protocol ZYGGCommonTableViewCell <NSObject>

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@optional
- (void)refreshData:(ZYGGCommonTableRow *)rowData tableView:(UITableView *)tableView;

@end
