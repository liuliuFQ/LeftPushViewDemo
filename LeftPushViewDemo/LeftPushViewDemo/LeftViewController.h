//
//  LeftViewController.h
//  LeftPushViewDemo
//
//  Created by jhl on 14-8-22.
//  Copyright (c) 2014年 深联智达(北京). All rights reserved.
//
typedef void(^Category)(NSString *);
#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController
@property(nonatomic,strong)Category category;
@end
