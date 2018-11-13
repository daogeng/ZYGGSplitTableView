//
//  ZYGGProtraitModel.h
//  ZYGGSplitTableView
//
//  Created by admin on 2018/11/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYGGProtraitModel : NSObject

@property (nonatomic, copy, readonly) NSString *imageName;

@property (nonatomic, copy, readonly) NSString *imageUrlString;

@property (nonatomic, copy, readonly) NSString *name;

- (instancetype)initWithImageName:(NSString *)imageName imageUrlString:(NSString *)imageUrlString name:(NSString *)name;

@end
