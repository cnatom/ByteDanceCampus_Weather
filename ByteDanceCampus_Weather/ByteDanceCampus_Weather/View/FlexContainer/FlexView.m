//
//  FlexView.m
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/9.
//

#import "FlexView.h"
#import "FlexContainer.h"

@interface FlexView()
@property(nonatomic,strong) NSMutableArray *views;
@end
@implementation FlexView

- (void)add:(FlexContainer *)flexContainer{
    [self addSubview:flexContainer];
    [self.views addObject:flexContainer];
}

- (void)layoutSubviews {
    [super layoutSubviews];

}


- (NSMutableArray *)views{
    if(_views==NULL){
        _views = [[NSMutableArray alloc]init];
    }
    return _views;
}

@end
