//
//  FlexItemContainer.h
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/8.
//


NS_ASSUME_NONNULL_BEGIN

/// 伸缩容器
/// 
@interface FlexContainer : UIButton

/// 顶部一直显示的部分
@property(nonatomic, strong) UIView *headerView;

/// 点击后伸缩出来的部分
@property(nonatomic, strong) UIView *childView;

@end

NS_ASSUME_NONNULL_END
