//
//  AutolayoutOneViewController.m
//  AutoLayoutAnimationDemo
//
//  Created by admin on 16/11/29.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "AutolayoutOneViewController.h"

@interface AutolayoutOneViewController ()

//13
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightViewTraillingConstraint;

//10
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leftViewTraillingConstraint;


@end

@implementation AutolayoutOneViewController


/**
  动画思路：
  ①界面View布局要清晰：两个视图，距离左右上下固定，两视图等宽，确定布局关系，
  ②添加左视图距离父视图的约束，修改右边约束的优先级，从UILayoutPriorityRequired到UILayoutPriorityDefaultHigh；
  ③动画根据约束的优先级进行调整，优先级高先执行。
  ④代码调整实现动画。
 */

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupNavigation {
    self.title = @"Animation1";
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                          style:UIBarButtonItemStyleDone
                                                                         target:self
                                                                         action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Handlers

- (IBAction)switchOn:(UISwitch *)sender {
    [self setupAutoLayoutAnimationWithStauts:sender.isOn];
}

- (void)setupAutoLayoutAnimationWithStauts:(BOOL)isOn {
    self.rightViewTraillingConstraint.priority = isOn ? UILayoutPriorityDefaultHigh - 1 : UILayoutPriorityDefaultHigh + 1;
    self.leftViewTraillingConstraint.constant = isOn ? 50.0f : 10.0f;
    [UIView animateWithDuration:0.5f animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
