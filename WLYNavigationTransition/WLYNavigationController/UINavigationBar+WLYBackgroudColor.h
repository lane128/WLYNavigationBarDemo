//
//  UINavigationBar+WLYBackgroudColor.h
//  elemeNavigationBar
//
//  Created by Lane on 2016/11/16.
//  Copyright © 2016年 me.lane128. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (WLYBackgroudColor)

- (void)setCustomBackgroundColor:(UIColor *)backgroundColor;

- (void)resetToTranslucent;

- (UIColor *)currentColor;

@end
