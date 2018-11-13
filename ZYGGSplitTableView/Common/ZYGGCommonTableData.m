//
//  ZYGGCommonTableData.m
//  ZYGGSplitTableView
//
//  Created by admin on 2018/11/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ZYGGCommonTableData.h"

#define DefaultUIRowHeight 50.f

@implementation ZYGGCommonTableSection

- (instancetype)initWithDict:(NSDictionary *)dict {
    if ([dict[Disable] boolValue]) {
        return nil;
    }
    self = [super init];
    if (self) {
        _headerTitle = dict[HeaderTitle];
        _rows = [ZYGGCommonTableRow rowsWithData:dict[RowContent]];
    }
    return self;
}

+ (NSArray *)sectionsWithData:(NSArray *)data {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:data.count];
    for (NSDictionary *dict in data) {
        ZYGGCommonTableSection *section = [[ZYGGCommonTableSection alloc] initWithDict:dict];
        if (section) {
            [array addObject:section];
        }
    }
    return array;
}

@end


@implementation ZYGGCommonTableRow

- (instancetype)initWithDict:(NSDictionary *)dict {
    if ([dict[Disable] boolValue]) {
        return nil;
    }
    self = [super init];
    if (self) {
        _title          = dict[Title];
        _detailTitle    = dict[DetailTitle];
        _cellClassName  = dict[CellClass];
        _cellActionName = dict[CellAction];
        _uiRowHeight    = dict[RowHeight] ? [dict[RowHeight] floatValue] : DefaultUIRowHeight;
        _extraInfo      = dict[ExtraInfo];
        _showAccessory  = [dict[ShowAccessory] boolValue];
        _forbidSelect   = [dict[ForbidSelect] boolValue];
    }
    return self;
}

+ (NSArray *)rowsWithData:(NSArray *)data {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:data.count];
    for (NSDictionary *dict in data) {
        ZYGGCommonTableRow *row = [[ZYGGCommonTableRow alloc] initWithDict:dict];
        if (row) {
            [array addObject:row];
        }
    }
    return array;
}



@end
