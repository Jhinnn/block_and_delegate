//
//  BaseTableViewCell.h
//  MyTableViewCell
//
//  Created by pengpeng on 2017/2/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTableViewCell;

@protocol BaseTableViewCellDelegate <NSObject>

- (void)onPressView:(BaseTableViewCell *)cell;

@end

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic,weak) __weak id <BaseTableViewCellDelegate> delegate;

@property (nonatomic, strong) UIImageView * headView;
@property (nonatomic, strong) UIButton * deleteBtn;


@end
