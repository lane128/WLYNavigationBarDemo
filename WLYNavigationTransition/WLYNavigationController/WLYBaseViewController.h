//
//  WLYBaseViewController.h
//  WLYNavigationTransition
//
//  Created by Lane on 2016/11/22.
//  Copyright © 2016年 me.lane128. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLYBaseViewController : UIViewController

@property (nonatomic, strong) UINavigationBar *fakeBar;
@property (nonatomic, assign) BOOL useTransparentNavigationBar;

- (void)addFakeNavigationBar;

- (void)removeFakeNavigationBar;

@end
