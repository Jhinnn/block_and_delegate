//
//  BaseTableViewCell.m
//  MyTableViewCell
//
//  Created by pengpeng on 2017/2/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self defaultInit];
    }
    return self;
}

- (void)defaultInit {
    self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteBtn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    self.deleteBtn.backgroundColor = [UIColor redColor];
    [self.deleteBtn addTarget:self action:@selector(pressAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.deleteBtn];
}

- (void)pressAction {
    if ([_delegate respondsToSelector:@selector(onPressView:)]) {
        [_delegate onPressView:self];
    }
    
    if (self.returnValueBlock) {
        self.returnValueBlock(@"这是Block");
    }
}

@end
