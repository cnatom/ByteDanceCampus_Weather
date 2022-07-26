//
//  HourlyWeather.h
//  ByteDanceCampus_Weather
//
//  Created by SSR on 2022/7/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HourlyWeather;

typedef HourlyWeather CurrentWeather;

typedef NSArray <HourlyWeather *> ForecastHourly;

/// 表名
FOUNDATION_EXPORT NSString *WeatherTableName;

@interface HourlyWeather : NSObject

/// 存储路径，也是DB所在位置
@property(nonatomic, readonly, class) NSString *tablePath;

/// 城市名字
@property (nonatomic, copy) NSString *cityName;

/// 时间
@property (nonatomic, copy) NSString *currentTime;

/// 时间（计算属性）
@property (nonatomic, readonly) NSDate *currentDate;

/// 云量
@property (nonatomic) CGFloat cloudCover;

/// 条件代码:用于展示对应天气图标
@property (nonatomic, copy) NSString *conditionCode;

/// 天气背景图
@property (nonatomic, copy) NSString *bgImageStr;

/// 气象图标
@property (nonatomic, copy) NSString *weatherIconStr;

/// 是否在白天
@property (nonatomic) BOOL daylight;

/// 湿度
@property (nonatomic) CGFloat humidity;

/// 降水强度
@property (nonatomic) CGFloat precipitationIntensity;

/// 压力
@property (nonatomic) CGFloat pressure;

/// 压力趋势
@property (nonatomic, copy) NSString *pressureTrend;

/// 温度
@property (nonatomic) CGFloat temperature;

/// 温度，NSString
@property (nonatomic, copy) NSString *temperatureStr;

/// 表观温度
@property (nonatomic) CGFloat temperatureApparent;

/// 露点温度
@property (nonatomic) CGFloat temperatureDewPoint;

/// 紫外线指数
@property (nonatomic) NSInteger uvIndex;

/// 能见度
@property (nonatomic) CGFloat visibility;

/// 风向
@property (nonatomic) NSInteger windDirection;

/// 风向汉字
@property (nonatomic, copy) NSString *windDirectionStr;

/// 阵风
@property (nonatomic) CGFloat windGust;

/// 风速
@property (nonatomic) CGFloat windSpeed;

/// 风速，NSString
@property (nonatomic, copy) NSString *windSpeedStr;


@end

NS_ASSUME_NONNULL_END
