//
//  AutoLayoutTwoViewController.m
//  AutoLayoutAnimationDemo
//
//  Created by admin on 16/11/29.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "AutoLayoutTwoViewController.h"

@interface AutoLayoutTwoViewController ()

@end

@implementation AutoLayoutTwoViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupNavigation {
    self.title = @"Animation2";
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
