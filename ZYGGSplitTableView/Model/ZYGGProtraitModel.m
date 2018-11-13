//
//  ZYGGProtraitModel.m
//  ZYGGSplitTableView
//
//  Created by admin on 2018/11/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ZYGGProtraitModel.h"

@implementation ZYGGProtraitModel

- (instancetype)initWithImageName:(NSString *)imageName imageUrlString:(NSString *)imageUrlString name:(NSString *)name {
    self = [super init];
    if (self) {
        _imageName = imageName.length ? imageName:@"avatar_user";
        _imageUrlString = imageUrlString;
        _name = name;
    }
    return self;
}

@end
