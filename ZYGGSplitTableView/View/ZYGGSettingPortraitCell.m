//
//  ZYGGSettingPortraitCell.m
//  ZYGGSplitTableView
//
//  Created by admin on 2018/11/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ZYGGSettingPortraitCell.h"
#import "ZYGGCommonTableData.h"
#import "ZYGGProtraitModel.h"

@interface ZYGGSettingPortraitCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ZYGGSettingPortraitCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    UIView *view = [[NSBundle mainBundle] loadNibNamed:@"ZYGGSettingPortraitCell" owner:self options:nil].firstObject;
    view.frame = self.frame;
    [self addSubview:view];
}

- (void)refreshData:(ZYGGCommonTableRow *)rowData tableView:(UITableView *)tableView {
    id extraInfo = rowData.extraInfo;
    if ([extraInfo isKindOfClass:[ZYGGProtraitModel class]]) {
        ZYGGProtraitModel *protrait = (ZYGGProtraitModel *)extraInfo;
        self.avatarImageView.image = [UIImage imageNamed:protrait.imageName];
        self.nameLabel.text = protrait.name;
    }
}

@end
