//
//  MainViewController.m
//  WLYNavigationTransition
//
//  Created by Lane on 2016/11/21.
//  Copyright © 2016年 me.lane128. All rights reserved.
//

#import "MainViewController.h"
#import <HexColors/HexColors.h>
#import <Masonry/Masonry.h>
#import "PushedViewController.h"
#import "UINavigationBar+WLYBackgroudColor.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"List";
    [self setupViews];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor hx_colorWithHexRGBAString:@"#FFF0CF"];
    [self.navigationController.navigationBar setCustomBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#2A3E4F"]];
}

- (void)setupViews {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Life Cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    cell.backgroundColor = [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:0.5];;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PushedViewController *vc = [[PushedViewController alloc] init];
    vc.useTransparentNavigationBar = YES; // Default is NO;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Getter & Setter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

@end
