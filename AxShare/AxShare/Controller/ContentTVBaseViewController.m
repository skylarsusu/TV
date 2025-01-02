//
//  ContentTVBaseViewController.m
//  AxShare
//
//  Created by 苏宝敬 on 2025/1/2.
//

#import "ContentTVBaseViewController.h"
#import "Macro.h"

@interface ContentTVBaseViewController ()

@end

@implementation ContentTVBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.categoryView];
    [self.view addSubview:self.listContainerView];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.categoryView.frame = CGRectMake(0, 0, [self preferredCategoryViewWidth], 300);
    self.listContainerView.frame = CGRectMake(0, 0, SCREEN_WIDTH - [self preferredCategoryViewWidth], 500);
    
    
}


#pragma mark - Custom Accessors

// 分页菜单视图
- (JXCategoryBaseView *)categoryView {
    if (!_categoryView) {
        _categoryView = [self preferredCategoryView];
        _categoryView.delegate = self;
        _categoryView.cellWidth = JXCategoryViewAutomaticDimension;
        
        // !!!: 将列表容器视图关联到 categoryView
        _categoryView.listContainer = self.listContainerView;
    }
    return _categoryView;
}

// 列表容器视图
- (JXCategoryListContainerView *)listContainerView {
    if (!_listContainerView) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    }
    return _listContainerView;
}



#pragma mark - Actions

- (void)navigationRightBarButtonAction:(id)sender {
    JXCategoryIndicatorView *componentView = (JXCategoryIndicatorView *)self.categoryView;
    for (JXCategoryIndicatorComponentView *view in componentView.indicators) {
        if (view.componentPosition == JXCategoryComponentPosition_Top) {
            view.componentPosition = JXCategoryComponentPosition_Bottom;
        } else {
            view.componentPosition = JXCategoryComponentPosition_Top;
        }
    }
    [componentView reloadDataWithoutListContainer];
}

#pragma mark - Public

- (JXCategoryBaseView *)preferredCategoryView {
    return [[JXCategoryBaseView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, [self preferredCategoryViewHeight]) scrollDerection:UICollectionViewScrollDirectionVertical];
}

- (CGFloat)preferredCategoryViewWidth {
    return 100;
}

#pragma mark - JXCategoryViewDelegate

// 点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    // 侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

// 滚动选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - JXCategoryListContainerViewDelegate

// 返回列表的数量
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

// 返回各个列表菜单下的实例，该实例需要遵守并实现 <JXCategoryListContentViewDelegate> 协议
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    
    if (index == 0) {
        LocalTVViewController *list = [[LocalTVViewController alloc] init];
        return list;
    }
    else {
        CreateTVViewController *list = [[CreateTVViewController alloc] init];
        return list;
    }
    
}

@end
