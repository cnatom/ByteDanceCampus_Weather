//
//  FlexContainerExample.m
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/8.
//
//

#import "FlexContainerExample.h"
#import "FlexContainer.h"

@interface FlexContainerExample ()
@property(nonatomic, strong) UIImageView *backgroundView;
@property(nonatomic, strong) UIVisualEffectView *blurContainer;

@property(nonatomic, strong) UIStackView *cols;
@end

@implementation FlexContainerExample {
    UIEdgeInsets marginContainer;
    UIEdgeInsets paddingContainer;
}
- (void)initConfig {
    marginContainer = UIEdgeInsetsMake(0, 12, 0, -12);
    paddingContainer = UIEdgeInsetsMake(12, 12, -12, -12);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initConfig];
    [self.view addSubview:self.backgroundView];
    [self.backgroundView addSubview:self.blurContainer];
    [self.blurContainer.contentView addSubview:self.cols];
    [self.view addSubview:self.cols];
    for (int i = 0; i < 5; i++) {
        FlexContainer *flexContainer = [[FlexContainer alloc] init];
        [self.cols addArrangedSubview:flexContainer];
    }
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.blurContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@200);
        make.left.equalTo(self.view.mas_left).offset(marginContainer.left);
        make.right.equalTo(self.view.mas_right).offset(marginContainer.right);
    }];

    [self.cols mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.blurContainer.mas_top).offset(paddingContainer.top);
        make.left.equalTo(self.blurContainer.mas_left).offset(paddingContainer.left);
        make.right.equalTo(self.blurContainer.mas_right).offset(paddingContainer.right);
        make.bottom.equalTo(self.blurContainer.mas_bottom).offset(paddingContainer.bottom);
    }];

}


#pragma mark - Getter

- (UIVisualEffectView *)blurContainer {
    if (_blurContainer == NULL) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
        UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
        _blurContainer = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _blurContainer.layer.cornerRadius = 16;
        _blurContainer.translatesAutoresizingMaskIntoConstraints = false;
        _blurContainer.alpha = 1;
        _blurContainer.layer.masksToBounds = YES;
    }
    return _blurContainer;
}

- (UIStackView *)cols {
    if (_cols == NULL) {
        _cols = [[UIStackView alloc] init];
        _cols.axis = UILayoutConstraintAxisVertical;
        _cols.spacing = 5;
    }
    return _cols;
}

- (UIImageView *)backgroundView {
    if (_backgroundView == NULL) {
        _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SunnyBG"]];
        _backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    }

    return _backgroundView;
}

#pragma mark - Router

+ (NSArray<NSString *> *)routerPath {
    return @[@"FlexContainerExample"];
}

+ (void)responseRequest:(RisingRouterRequest *)request completion:(RisingRouterResponseBlock)completion {

    RisingRouterResponse *response = [[RisingRouterResponse alloc] init];

    switch (request.requestType) {
        case RouterRequestPush: {

            UINavigationController *nav = (request.requestController ? request.requestController : RisingRouterRequest.useTopController).navigationController;

            if (nav) {
                FlexContainerExample *vc = [[self alloc] init];
                response.responseController = vc;

                [nav pushViewController:vc animated:YES];
            } else {

                response.errorCode = RouterResponseWithoutNavagation;
            }

        }
            break;

        case RouterRequestParameters: {
            // TODO: 传回参数
        }
            break;

        case RouterRequestController: {

            FlexContainerExample *vc = [[self alloc] init];

            response.responseController = vc;
        }
            break;
    }

    if (completion) {
        completion(response);
    }
}


@end
