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
    self.headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.contentView addSubview:self.headView];
    
    self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteBtn.frame = CGRectMake(0, 100, 60, 30);
    [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [self.deleteBtn addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
     [self.contentView addSubview:self.deleteBtn];
}

- (void)deleteAction {
    if (_delegate && [_delegate respondsToSelector:@selector(onPressView:)]) {
        [_delegate onPressView:self];
    }
}

@end
