//
//  MainViewController.m
//  AxShare
//
//  Created by 苏宝敬 on 2025/1/1.
//

#import "MainViewController.h"
#import "JXCategoryTitleView.h"
#import "JXCategoryTitleVerticalZoomView.h"

@interface MainViewController ()

@property (nonatomic, strong) JXCategoryTitleVerticalZoomView *myCategoryView;

@end

@implementation MainViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titles = @[@"本地投屏", @"创作投屏",@""];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = false;
    self.myCategoryView.titles = self.titles;
    
    
}

- (JXCategoryTitleVerticalZoomView *)myCategoryView {
    
    return (JXCategoryTitleVerticalZoomView *)self.categoryView;
}

- (JXCategoryBaseView *)preferredCategoryView {
    JXCategoryTitleVerticalZoomView *titleView = [[JXCategoryTitleVerticalZoomView alloc] init];
    
    titleView.titleSelectedColor = [UIColor blackColor];
    titleView.titleSelectedFont = [UIFont boldSystemFontOfSize:15];
    titleView.titleFont = [UIFont systemFontOfSize:15];
    titleView.titleLabelAnchorPointStyle = JXCategoryTitleLabelAnchorPointStyleBottom;
    titleView.titleLabelVerticalOffset = 0;
    titleView.titleColorGradientEnabled = YES;
    titleView.contentEdgeInsetLeft = 15;    //设置内容左边距
    //推荐配置方案
    titleView.maxVerticalCellSpacing = 20;
    titleView.minVerticalCellSpacing = 10;
    titleView.cellSpacing = 10;
    titleView.cellWidth = 0;
    
    return titleView;
}


@end
