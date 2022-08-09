//
//  FlexItemContainer.m
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/8.
//

#import "FlexContainer.h"
#import "HeaderView.h"
#import "ChildView.h"

@interface FlexContainer ()

/// 顶部一直显示的部分
@property(nonatomic, strong) HeaderView *headerView;

/// 点击后伸缩出来的部分
@property(nonatomic, strong) ChildView *childView;

/// 垂直布局
@property(nonatomic, strong) UIStackView *colsView;

@end

@implementation FlexContainer {
    UIEdgeInsets paddingContainer;
}
#pragma mark - 初始化

- (instancetype)initWithHeaderView:(HeaderView *)headerView childView:(ChildView *)childView {
    self = [super init];
    if (self) {
        [self initConfig];
        self.headerView = headerView;
        self.childView = childView;
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        self.layer.cornerRadius = 16;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithHeaderView:[[HeaderView alloc] init] childView:[[ChildView alloc] init]];
    return self;
}

- (void)initConfig {
    paddingContainer = UIEdgeInsetsMake(16, 13, 16, 13);
}

#pragma mark - 函数
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

#pragma mark - 布局

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.colsView];
    [self.colsView addArrangedSubview:self.headerView];
    [self.colsView addArrangedSubview:self.childView];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(paddingContainer.top);
        make.bottom.equalTo(self).offset(-paddingContainer.bottom);
        make.left.equalTo(self).offset(paddingContainer.left);
        make.right.equalTo(self).offset(-paddingContainer.right);
    }];
    [self.colsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(paddingContainer.top);
        make.bottom.equalTo(self).offset(-paddingContainer.bottom);
        make.left.equalTo(self).offset(paddingContainer.left);
        make.right.equalTo(self).offset(-paddingContainer.right);
    }];
}

#pragma mark - Getter



- (UIStackView *)colsView {
    if (_colsView == NULL) {
        _colsView = [[UIStackView alloc] init];
        _colsView.axis = UILayoutConstraintAxisVertical;
        _colsView.spacing = 10;
    }
    return _colsView;
}

#pragma mark - Setter
- (void)setHeaderView:(HeaderView *)headerView{
    _headerView = headerView;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(show:)];
    _headerView.userInteractionEnabled = YES;
    [_headerView addGestureRecognizer:tap];
}

- (void)setChildView:(ChildView *)childView{
    _childView = childView;
    _childView.hidden = true;
}

@end
