//
//  FlexItemContainer.m
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/8.
//

#import "FlexItemContainer.h"
#import "FlexItemHeaderView.h"
#import "FlexItemChildView.h"

@interface FlexItemContainer ()
@property(nonatomic, strong) UIStackView *colsView;
@property(nonatomic, strong) UIView *headerView;
@property(nonatomic, strong) UIView *childView;
@end

@implementation FlexItemContainer {
    UIEdgeInsets marginContainer;
    UIEdgeInsets marginHeader;
    CGFloat cornerRadius;
}
#pragma mark - Init


- (instancetype)init {
    self = [super init];
    if (self) {
        [self initConfig];
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        self.layer.cornerRadius = cornerRadius;
    }
    return self;
}

- (void)initConfig {
    marginContainer = UIEdgeInsetsMake(0, 16, 0, 16);
    marginHeader = UIEdgeInsetsMake(10, 16, 10, 16);
    cornerRadius = 16;
}


- (IBAction)show:(id)sender {
    [UIView animateWithDuration:0.1 animations:^{
        if (self.childView.hidden == false) {
            self.childView.hidden = true;
            self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        } else {
            self.childView.hidden = false;
            self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2];

        }
    }];
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.superview).offset(marginContainer.left);
        make.right.equalTo(self.superview).offset(-marginContainer.right);
    }];
    [self addSubview:self.colsView];
    [self.colsView addArrangedSubview:self.headerView];
    [self.colsView addArrangedSubview:self.childView];
    [self.colsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(marginHeader.top);
        make.bottom.equalTo(self).offset(-marginHeader.bottom);
        make.left.equalTo(self).offset(marginHeader.left);
        make.right.equalTo(self).offset(-marginHeader.right);
    }];
}

#pragma mark - Getter

- (UIView *)headerView {
    if (_headerView == NULL) {
        _headerView = [[FlexItemHeaderView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(show:)];
        _headerView.userInteractionEnabled = YES;
        [_headerView addGestureRecognizer:tap];
    }
    return _headerView;
}

- (UIStackView *)colsView {
    if (_colsView == NULL) {
        _colsView = [[UIStackView alloc] init];
        _colsView.axis = UILayoutConstraintAxisVertical;
        _colsView.spacing = 10;
    }
    return _colsView;
}

- (UIView *)childView {
    if (_childView == NULL) {
        _childView = [[FlexItemChildView alloc] init];
        _childView.hidden = true;
    }
    return _childView;
}


@end
