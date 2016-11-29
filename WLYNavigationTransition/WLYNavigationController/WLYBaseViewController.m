//
//  WLYBaseViewController.m
//  WLYNavigationTransition
//
//  Created by Lane on 2016/11/22.
//  Copyright © 2016年 me.lane128. All rights reserved.
//

#import "WLYBaseViewController.h"
#import "UINavigationBar+WLYBackgroudColor.h"
#import <HexColors/HexColors.h>

@interface WLYBaseViewController ()

@end

@implementation WLYBaseViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)viewDidDisappear:(BOOL)animated {
    
}

#pragma mark - Public

- (void)addFakeNavigationBar {
    [self.view addSubview:self.fakeBar];
}

- (void)removeFakeNavigationBar {
    if (_fakeBar) {
        [_fakeBar removeFromSuperview];
        _fakeBar = nil;
    }
}

- (void)dealloc {
    NSLog(@"dealloc: %@", NSStringFromClass([self class]));
    [self removeFakeNavigationBar];
}

#pragma mark - Getter & Setter

- (UINavigationBar *)fakeBar {
    if (!_fakeBar) {
        _fakeBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 64)];
        _fakeBar.shadowImage = [UIImage new];
        _fakeBar.barStyle = [UINavigationBar appearance].barStyle;
        [_fakeBar setCustomBackgroundColor:[self.navigationController.navigationBar currentColor]];
        _fakeBar.translucent = YES;
        _fakeBar.userInteractionEnabled = NO;
    }
    return _fakeBar;
}

@end
