//
//  TestFlexContainerController.m
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/8.
//
//
#import "TestFlexContainerController.h"
#import "FlexItemContainer.h"

@interface TestFlexContainerController ()
@property(nonatomic, strong) UIImageView *backgroundView;
@property(nonatomic, strong) UIStackView *container;

@end

@implementation TestFlexContainerController {
    UIEdgeInsets marginContainer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.container];
    [self.container addArrangedSubview:UIView.new];
    [self.container addArrangedSubview:FlexItemContainer.new];
    [self.container addArrangedSubview:FlexItemContainer.new];
    [self.container addArrangedSubview:FlexItemContainer.new];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);

    }];
}

- (void)initConfig {
    marginContainer = UIEdgeInsetsMake(0, 16, 0, 16);
}

#pragma mark - Getter


- (UIStackView *)container{
    if (_container==NULL) {
        _container = UIStackView.new;
        _container.axis = UILayoutConstraintAxisVertical;
    }
    return _container;
}



- (UIImageView *)backgroundView {
    if (_backgroundView == NULL) {
        _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SunnyBG"]];
    }

    return _backgroundView;
}

#pragma mark - Router

+ (NSArray<NSString *> *)routerPath {
    return @[@"TestFlexContainerController"];
}

+ (void)responseRequest:(RisingRouterRequest *)request completion:(RisingRouterResponseBlock)completion {

    RisingRouterResponse *response = [[RisingRouterResponse alloc] init];

    switch (request.requestType) {
        case RouterRequestPush: {

            UINavigationController *nav = (request.requestController ? request.requestController : RisingRouterRequest.useTopController).navigationController;

            if (nav) {
                TestFlexContainerController *vc = [[self alloc] init];
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

            TestFlexContainerController *vc = [[self alloc] init];

            response.responseController = vc;
        }
            break;
    }

    if (completion) {
        completion(response);
    }
}


@end
