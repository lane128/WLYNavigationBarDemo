//
//  PushedViewController.m
//  WLYNavigationTransition
//
//  Created by Lane on 2016/11/21.
//  Copyright © 2016年 me.lane128. All rights reserved.
//

#import "PushedViewController.h"
#import <Masonry/Masonry.h>
#import <HexColors/HexColors.h>
#import "UINavigationBar+WLYBackgroudColor.h"
#import "ThirdViewController.h"

@interface PushedViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIButton *newPushButton;

@end

@implementation PushedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    self.title = @"Pushed View";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    CGRect rect = self.navigationController.navigationBar.frame;
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:rect];
    rect.origin = CGPointMake(0, -20);
    rect.size.height += 20;
    [bar setShadowImage:[self.navigationController.navigationBar.shadowImage copy]];
    [self.view addSubview:bar];
}

- (void)setupViews {
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.headerImageView];
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.newPushButton];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.width.equalTo(self.view);
        make.bottom.equalTo(self.contentView);
    }];
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.scrollView);
        make.width.equalTo(self.view);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.scrollView);
        make.top.equalTo(self.headerImageView.mas_bottom);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(self.view.mas_height);
    }];
    
    [self.newPushButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollView);
        make.top.equalTo(self.headerImageView.mas_bottom).offset(200);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    [self removeFakeNavigationBar];
    if (offsetY > 0) {
        CGFloat alpha = MIN(1, offsetY / 100.0);
        [self.navigationController.navigationBar setCustomBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#0084DC" alpha:alpha]];
    } else {
        [self.navigationController.navigationBar setCustomBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark - Getter & Setter

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headerImage.jpg"]];
    }
    return _headerImageView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor hx_colorWithHexRGBAString:@"#FFF0CF"];
    }
    return _contentView;
}

- (UIButton *)newPushButton {
    if (!_newPushButton) {
        _newPushButton = [[UIButton alloc] init];
        [_newPushButton addTarget:self action:@selector(pushNewViewController) forControlEvents:UIControlEventTouchUpInside];
        _newPushButton.backgroundColor = [UIColor hx_colorWithHexRGBAString:@"#E74C3C"];
        [_newPushButton setTitle:@"Click Me" forState:UIControlStateNormal];
    }
    return _newPushButton;
}

#pragma mark - Others

- (void)pushNewViewController {
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    thirdVC.useTransparentNavigationBar = YES;
    [self.navigationController pushViewController:thirdVC animated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)useTransparentNavigationBar {
    return YES;
}

- (void)dealloc {
    
}

@end
