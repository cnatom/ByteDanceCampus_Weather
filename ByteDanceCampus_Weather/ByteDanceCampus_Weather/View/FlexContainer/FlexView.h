//
//  FlexView.h
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/9.
//

#import <UIKit/UIKit.h>
@class FlexContainer;
NS_ASSUME_NONNULL_BEGIN

@interface FlexView : UIView
-(instancetype)initWithContents:(NSArray<FlexContainer *>*)array;

@end

NS_ASSUME_NONNULL_END
