//
//  ZYGGCommonTableDelegate.m
//  ZYGGSplitTableView
//
//  Created by admin on 2018/11/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ZYGGCommonTableDelegate.h"
#import "ZYGGCommonTableData.h"
#import "ZYGGCommonTableViewCell.h"
#import "UIView+ZYGG.h"

static NSString *DefaultTableCell = @"UITableViewCell";

@interface ZYGGCommonTableDelegate ()

@property (nonatomic, copy) NSArray *(^ZYGGDataReciever)(void);

@end

@implementation ZYGGCommonTableDelegate

- (instancetype)initWithTableData:(NSArray *(^)(void))data {
    self = [super init];
    if (self) {
        _ZYGGDataReciever = data;
    }
    return self;
}

- (NSArray *)data {
    return self.ZYGGDataReciever();
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ZYGGCommonTableSection *tableSection = self.data[section];
    return tableSection.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYGGCommonTableSection *tableSection = self.data[indexPath.section];
    ZYGGCommonTableRow *tableRow = tableSection.rows[indexPath.row];
    NSString *identify = tableRow.cellClassName.length ? tableRow.cellClassName : DefaultTableCell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        Class clazz = NSClassFromString(identify);
        cell = [[clazz alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    if (![cell respondsToSelector:@selector(refreshData:tableView:)]) {
        UITableViewCell *defaultCell = (UITableViewCell *)cell;
        [self refreshData:tableRow cell:defaultCell];
    } else {
        [(id<ZYGGCommonTableViewCell>)cell refreshData:tableRow tableView:tableView];
    }
    cell.accessoryType = tableRow.showAccessory ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYGGCommonTableSection *tableSection = self.data[indexPath.section];
    ZYGGCommonTableRow *tableRow = tableSection.rows[indexPath.row];
    return tableRow.uiRowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ZYGGCommonTableSection *tableSection = self.data[indexPath.section];
    ZYGGCommonTableRow *tableRow = tableSection.rows[indexPath.row];
    if (!tableRow.forbidSelect) {
        UIViewController *vc = tableView.zygg_viewController;
        NSString *actionName = tableRow.cellActionName;
        if (actionName.length) {
            SEL sel = NSSelectorFromString(actionName);
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            [vc performSelector:sel withObject:cell];
            // SuppressPerformSelectorLeakWarning([vc performSelector:sel withObject:cell]);
        }
    }
}

#pragma mark - Private
- (void)refreshData:(ZYGGCommonTableRow *)tableRow cell:(UITableViewCell *)cell {
    cell.textLabel.text = tableRow.title;
    cell.detailTextLabel.text = tableRow.detailTitle;
}

@end
