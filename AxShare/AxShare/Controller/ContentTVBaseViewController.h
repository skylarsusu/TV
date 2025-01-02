//
//  ContentTVBaseViewController.h
//  AxShare
//
//  Created by 苏宝敬 on 2025/1/2.
//

#import <UIKit/UIKit.h>
#import "JXCategoryView.h"
#import "JXCategoryListContainerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContentTVBaseViewController : UIViewController<JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) JXCategoryBaseView *categoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (nonatomic, assign) BOOL isNeedIndicatorPositionChangeItem;

- (JXCategoryBaseView *)preferredCategoryView;
- (CGFloat)preferredCategoryViewHeight;

@end

NS_ASSUME_NONNULL_END
