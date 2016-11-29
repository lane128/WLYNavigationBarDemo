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

@interface PushedViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation PushedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    self.title = @"Pushed View";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self.navigationController.navigationBar setTintColor:[UIColor hx_colorWithHexRGBAString:@"#737373" alpha:0]];
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

#pragma mark - Others

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)useTransparentNavigationBar {
    return YES;
}

- (void)dealloc {
    NSLog(@"Pushed ViewController dealloc");
}

@end
