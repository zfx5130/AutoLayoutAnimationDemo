//
//  AutoLayoutTwoViewController.m
//  AutoLayoutAnimationDemo
//
//  Created by admin on 16/11/29.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "AutoLayoutTwoViewController.h"

@interface AutoLayoutTwoViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UIButton *detailButton;

@property (strong, nonatomic) IBOutlet UIButton *downloadButton;


//10
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *detailButtonRightConstraint;

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

#pragma mark - Private

- (void)setupAutoLayoutAnimationWithStatus:(BOOL)isHidden {
    [self.view layoutIfNeeded];
    self.detailButtonRightConstraint.constant = isHidden ? -42.0f : 10.0f;
    self.detailButton.alpha = isHidden ? 0.3f : 1.0f;
    self.downloadButton.alpha = isHidden ? 0.3f : 1.0f;
    [UIView animateWithDuration:.5f animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"测试";
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setupAutoLayoutAnimationWithStatus:NO];
        });
    } else {
        [self setupAutoLayoutAnimationWithStatus:YES];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self setupAutoLayoutAnimationWithStatus:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self setupAutoLayoutAnimationWithStatus:NO];
}

@end
