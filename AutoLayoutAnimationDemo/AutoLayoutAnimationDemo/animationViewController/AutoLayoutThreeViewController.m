//
//  AutoLayoutThreeViewController.m
//  AutoLayoutAnimationDemo
//
//  Created by admin on 16/11/29.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "AutoLayoutThreeViewController.h"

@interface AutoLayoutThreeViewController ()

@end

@implementation AutoLayoutThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupNavigation {
    self.title = @"animation3";
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                          style:UIBarButtonItemStyleDone
                                                                         target:self
                                                                         action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
