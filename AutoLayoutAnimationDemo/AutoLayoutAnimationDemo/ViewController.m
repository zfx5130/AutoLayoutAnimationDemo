//
//  ViewController.m
//  AutoLayoutAnimationDemo
//
//  Created by admin on 16/11/29.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "ViewController.h"

#import "AutolayoutOneViewController.h"
#import "AutoLayoutTwoViewController.h"
#import "AutoLayoutThreeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Handlers

- (IBAction)animation:(UIButton *)sender {
    [self swapViewControllerWithIndex:sender.tag];
}

- (void)swapViewControllerWithIndex:(NSInteger)index {
    
    UIViewController *viewController;
    if (index == 1) {
        viewController = [[AutolayoutOneViewController alloc] init];
    } else if (index == 2) {
        viewController = [[AutoLayoutTwoViewController alloc] init];
    } else  {
        viewController = [[AutoLayoutThreeViewController alloc] init];
    }
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}


@end
