//
//  FlexView.m
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/9.
//

#import "FlexView.h"
#import "FlexContainer.h"

@interface FlexView()
@property(nonatomic,strong) NSArray<FlexContainer *> *views;
@property (nonatomic, strong) UIStackView *cols;
@end
@implementation FlexView

- (instancetype)init{
    self = [self initWithContents:@[]];
    return self;
}

- (instancetype)initWithContents:(NSArray *)array {
    self = [super init];
    if(self){
        self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.1];
        self.layer.cornerRadius = 16;
        self.views = array;
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.cols];
    for(FlexContainer *s in self.views){
        [self.cols addArrangedSubview:s];
    }

    [self.cols mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(13);
        make.left.equalTo(self).offset(13);
        make.right.equalTo(self).offset(-13);
        make.bottom.equalTo(self);
    }];
}

- (UIStackView *)cols {
    if (_cols == NULL) {
        _cols = [[UIStackView alloc] init];
        _cols.axis = UILayoutConstraintAxisVertical;
    }
    return _cols;
}

- (NSArray<FlexContainer *> *)views {
    if (_views == NULL) {
        _views = [[NSArray alloc] init];
    }
    return _views;
}

@end
