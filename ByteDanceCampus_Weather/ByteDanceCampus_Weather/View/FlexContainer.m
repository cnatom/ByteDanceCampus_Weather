//
//  FlexContainer.m
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/8.
//
//

#import "FlexContainer.h"

@interface FlexContainer ()
@property(nonatomic, strong) UIStackView *colsView;
@end

@implementation FlexContainer {

}

- (instancetype)init {
    self = [self initWithChildren:@[].copy];
    return self;
}

- (instancetype)initWithChildren:(NSArray<UIView *> *)children {
    self = super.init;
    if (self) {
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
        self.layer.cornerRadius = 16;
        for (UIView *view in children) {
            [self.colsView addArrangedSubview:view];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.colsView];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.colsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UIStackView *)colsView {
    if (_colsView == NULL) {
        _colsView = [[UIStackView alloc] init];
        _colsView.axis = UILayoutConstraintAxisVertical;
    }
    return _colsView;
}


@end
