//
//  FlexItemHeaderView.h
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/8.
//
//


NS_ASSUME_NONNULL_BEGIN

@interface HeaderView : UIView

/// 今天是周几 比如："今天""周一""周二"
@property(nonatomic, strong) UILabel *weekView;

/// 天气小图标
@property(nonatomic, strong) UIImageView *iconView;

///最低温度
@property(nonatomic, strong) UILabel *minView;

///最高温度
@property(nonatomic, strong) UILabel *maxView;

@end

NS_ASSUME_NONNULL_END
