//
//  MyViewController.m
//  MyTableViewCell
//
//  Created by pengpeng on 2017/2/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "MyViewController.h"
#import "BaseTableViewCell.h"

/*
 第一步：设置重用标识符
 //1.static修饰的语句，只运行一次，并且不可以被其他文件访问到。（防止干扰其他文件对重用标识符的重复使用产生错误）
 //2.const修饰的内容在程序运行期间不可以被修改，保证了cell从重用池里面取出来的是正确对象
 */

static NSString *const reuseID = @"deleteReuseIdentifier";

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
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    cell.delegate = self;
    cell.returnValueBlock = ^(NSString *value) {
        NSLog(@"%@",value);
    };
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
        _tableView.rowHeight = 100;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        [_tableView registerClass:[BaseTableViewCell class] forCellReuseIdentifier:reuseID];
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
