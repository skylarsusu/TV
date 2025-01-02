//
//  LocalTVViewController.m
//  AxShare
//
//  Created by 苏宝敬 on 2025/1/1.
//

#import "LocalTVViewController.h"

@interface LocalTVViewController ()

@end

@implementation LocalTVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - JXCategoryListContentViewDelegate

/**
 实现 <JXCategoryListContentViewDelegate> 协议方法，返回该视图控制器所拥有的「视图」
 */
- (UIView *)listView {
    return self.view;
}

@end
