//
//  MainViewController.m
//  LeftPushViewDemo
//
//  Created by jhl on 14-8-22.
//  Copyright (c) 2014年 深联智达(北京). All rights reserved.
//

#import "MainViewController.h"
#import "LeftViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
       [self.revealSideViewController setDirectionsToShowBounce:PPRevealSideDirectionBottom | PPRevealSideDirectionLeft | PPRevealSideDirectionRight | PPRevealSideDirectionTop];
    UISwipeGestureRecognizer * swip = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(pushView:)];
    swip.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swip];
}
- (IBAction)pushView:(id)sender {
    
    LeftViewController * leftV  = [[LeftViewController alloc]init];
    [leftV setCategory:^(NSString * cate){
    
        self.label.text = cate;
    
    }];
    [self.revealSideViewController pushViewController:leftV onDirection:PPRevealSideDirectionLeft withOffset:70.0f animated:YES completion:^{
        
    }];
    PP_RELEASE(leftV);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
