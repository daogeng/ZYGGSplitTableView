//
//  ZYGGCommonTableDelegate.h
//  ZYGGSplitTableView
//
//  Created by admin on 2018/11/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYGGCommonTableDelegate : NSObject<UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithTableData:(NSArray *(^)(void))data;

@end
