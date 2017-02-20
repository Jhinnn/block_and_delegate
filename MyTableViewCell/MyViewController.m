//
//  MyViewController.m
//  MyTableViewCell
//
//  Created by pengpeng on 2017/2/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "MyViewController.h"
#import "BaseTableViewCell.h"
@interface MyViewController () <UITableViewDataSource,UITableViewDelegate,BaseTableViewCellDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellName = @"cell";
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    cell.delegate = self;
    return cell;
}

- (void)onPressView:(BaseTableViewCell *)cell {
    NSLog(@"删除!");
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 200;
        _tableView.alwaysBounceVertical = YES;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[BaseTableViewCell class] forCellReuseIdentifier:@"cell"];

    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
