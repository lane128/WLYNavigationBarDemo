//
//  WLYNavigationController.m
//  WLYNavigationTransition
//
//  Created by Lane on 2016/11/21.
//  Copyright © 2016年 me.lane128. All rights reserved.
//

#import "WLYNavigationController.h"
#import "UINavigationController+Block.h"
#import "UINavigationBar+WLYBackgroudColor.h"
#import "PushedViewController.h"
#import <objc/runtime.h>

@interface WLYNavigationController ()

@end

@implementation WLYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)pushViewController:(WLYBaseViewController *)viewController animated:(BOOL)animated {
    WLYBaseViewController *currentVC = self.viewControllers.lastObject;
    if (currentVC.navigationController.navigationBar && !currentVC.navigationController.navigationBarHidden) {
        if (!currentVC.useTransparentNavigationBar && viewController.useTransparentNavigationBar) {
            [currentVC addFakeNavigationBar];
            [currentVC.navigationController.navigationBar resetToTranslucent];
        }
        if (currentVC.useTransparentNavigationBar && viewController.useTransparentNavigationBar) {
            [currentVC addFakeNavigationBar];
            [currentVC.navigationController.navigationBar resetToTranslucent];
        }
        if (currentVC.useTransparentNavigationBar && !viewController.useTransparentNavigationBar) {
            [currentVC addFakeNavigationBar];
            [currentVC.navigationController.navigationBar resetToTranslucent];
        }
    } else {
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    WLYBaseViewController *previousVC = self.viewControllers[self.viewControllers.count - 2];
    WLYBaseViewController *currentVC = self.viewControllers.lastObject;
    [currentVC addFakeNavigationBar];
    [currentVC.navigationController.navigationBar resetToTranslucent];
    return [super popViewControllerAnimated:animated];
}

@end
