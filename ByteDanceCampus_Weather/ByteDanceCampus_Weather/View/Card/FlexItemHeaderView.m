//
//  FlexItemHeaderView.m
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/8.
//
//

#import "FlexItemHeaderView.h"

@interface FlexItemHeaderView ()
@property(nonatomic, strong) UIStackView *rows;
@property(nonatomic, strong) UILabel *weekView;
@property(nonatomic, strong) UIImageView *iconView;
@property(nonatomic, strong) UILabel *minView;
@property(nonatomic, strong) UIView *line;
@property(nonatomic, strong) UILabel *maxView;
@end

@implementation FlexItemHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
//        self.backgroundColor = [UIColor greenColor];

    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.rows];
    [self.rows addArrangedSubview:self.weekView];
    [self.rows addArrangedSubview:self.iconView];
    [self.rows addArrangedSubview:self.minView];
    [self.rows addArrangedSubview:self.maxView];
    [self.rows mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UILabel *)weekView {
    if (_weekView == NULL) {
        _weekView = [[UILabel alloc] init];
        _weekView.text = @"今天";
        _weekView.textColor = [UIColor whiteColor];
        _weekView.font = [UIFont boldSystemFontOfSize:21];
    }
    return _weekView;
}

- (UIStackView *)rows {
    if (_rows == NULL) {
        _rows = [[UIStackView alloc] init];
        _rows.axis = UILayoutConstraintAxisHorizontal;
        _rows.distribution = UIStackViewDistributionEqualSpacing;
    }
    return _rows;
}

- (UIImageView *)iconView {
    if (_iconView == NULL) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        _iconView.image = [UIImage imageNamed:@"sun.max.fill"];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconView;
}

- (UILabel *)minView {
    if (_minView == NULL) {
        _minView = [[UILabel alloc] init];
        _minView.text = @"31°";
        _minView.font = [UIFont boldSystemFontOfSize:21];
        _minView.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    }
    return _minView;
}

- (UILabel *)maxView {
    if (_maxView == NULL) {
        _maxView = [[UILabel alloc] init];
        _maxView.text = @"35°";
        _maxView.font = [UIFont boldSystemFontOfSize:21];
        _maxView.textColor = [UIColor whiteColor];
    }
    return _maxView;
}

@end
