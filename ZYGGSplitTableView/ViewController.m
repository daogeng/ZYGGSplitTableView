//
//  ViewController.m
//  ZYGGSplitTableView
//
//  Created by admin on 2018/11/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ViewController.h"
#import "ZYGGCommonTableDelegate.h"
#import "ZYGGCommonTableData.h"
#import "ZYGGProtraitModel.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZYGGCommonTableDelegate *delegator;

@property (nonatomic, strong) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self buildData];
    __weak typeof(self) wself = self;
    self.delegator = [[ZYGGCommonTableDelegate alloc] initWithTableData:^NSArray *{
        return wself.data;
    }];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView.delegate = self.delegator;
    self.tableView.dataSource = self.delegator;
}

- (void)buildData {
    NSArray *data = @[
                      @{
                          HeaderTitle: @"",
                          RowContent: @[@{
                                            ExtraInfo: [[ZYGGProtraitModel alloc] initWithImageName:nil imageUrlString:nil name:@"ZYGG"],
                                            CellClass: @"ZYGGSettingPortraitCell",
                                            CellAction: @"onActionTouchProtrait:",
                                            RowHeight: @(60),
                                            }]
                          },
                      @{
                          HeaderTitle: @"",
                          RowContent: @[@{
                                            Title   : @"关于1",
                                            CellAction: @"onTouchAbout:",
                                            ShowAccessory: @(YES),
                                            },
                                        @{
                                            Title   : @"关于2",
                                            CellAction: @"onTouchAbout:",
                                            Disable: @(YES),
                                            }]
                          },
                      ];
    self.data = [ZYGGCommonTableSection sectionsWithData:data];
}

- (void)refreshData {
    [self buildData];
    [self.tableView reloadData];
}

- (void)onActionTouchProtrait:(id)sender {
    
}

- (void)onTouchAbout:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
