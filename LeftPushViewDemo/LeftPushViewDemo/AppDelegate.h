//
//  AppDelegate.h
//  LeftPushViewDemo
//
//  Created by jhl on 14-8-22.
//  Copyright (c) 2014年 深联智达(北京). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,PPRevealSideViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PPRevealSideViewController *revealSideViewController;

@end
