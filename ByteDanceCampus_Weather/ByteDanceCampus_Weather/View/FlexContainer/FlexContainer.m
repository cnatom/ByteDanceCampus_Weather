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
@property(nonatomic, strong) UIStackView *colsView;

@end

@implementation FlexContainer {
    UIEdgeInsets paddingContainer;
}
#pragma mark - Init


- (instancetype)init {
    self = [super init];
    if (self) {
        [self initConfig];
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        self.layer.cornerRadius = 16;
    }
    return self;
}

- (void)initConfig {
    paddingContainer = UIEdgeInsetsMake(16, 13, 16, 13);
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
    [self addSubview:self.colsView];
    [self.colsView addArrangedSubview:self.headerView];
    [self.colsView addArrangedSubview:self.childView];
    [self.colsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(paddingContainer.top);
        make.bottom.equalTo(self).offset(-paddingContainer.bottom);
        make.left.equalTo(self).offset(paddingContainer.left);
        make.right.equalTo(self).offset(-paddingContainer.right);
    }];
}

#pragma mark - Getter

- (UIView *)headerView {
    if (_headerView == NULL) {
        _headerView = [[HeaderView alloc] init];
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
        _childView = [[ChildView alloc] init];
        _childView.hidden = true;
    }
    return _childView;
}


@end
