//
//  ZYGGCommonTableData.h
//  ZYGGSplitTableView
//
//  Created by admin on 2018/11/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

//section key
#define HeaderTitle     @"headerTitle"
#define RowContent      @"row"

//row key
#define Title           @"title"
#define DetailTitle     @"detailTitle"
#define CellClass       @"cellClassName"
#define CellAction      @"cellActionName"
#define RowHeight       @"uiRowHeight"
#define ExtraInfo       @"extraInfo"

//common key
#define Disable         @"disable"      //cell不可见
#define ShowAccessory   @"accessory"    //cell显示>箭头
#define ForbidSelect    @"forbidSelect" //cell不响应select事件

@interface ZYGGCommonTableSection : NSObject

@property (nonatomic, copy) NSString *headerTitle;

@property (nonatomic, strong) NSArray *rows;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (NSArray *)sectionsWithData:(NSArray *)data;

@end

@interface ZYGGCommonTableRow : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *detailTitle;

@property (nonatomic, copy) NSString *cellClassName;

@property (nonatomic, copy) NSString *cellActionName;

@property (nonatomic, assign) CGFloat uiRowHeight;

@property (nonatomic, assign) BOOL showAccessory;

@property (nonatomic, assign) BOOL forbidSelect;

@property (nonatomic, strong) id extraInfo;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (NSArray *)rowsWithData:(NSArray *)data;

@end
