//
//  FlexItemChildView.m
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/8.
//
//

#import "FlexItemChildView.h"

@interface FlexItemChildView ()
@property(nonatomic, strong) UILabel *text;
@end

@implementation FlexItemChildView


- (instancetype)init {
    self = [super init];
    if (self) {
//        self.backgroundColor = [UIColor greenColor];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.text];
    [self.text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UILabel *)text {
    if (_text == NULL) {
        _text = [[UILabel alloc] init];
        _text.text = @"Child";
    }
    return _text;
}

@end
