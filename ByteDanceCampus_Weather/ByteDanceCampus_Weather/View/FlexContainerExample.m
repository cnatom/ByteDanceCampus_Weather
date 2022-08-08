//
//  FlexContainerExample.m
//  ByteDanceCampus_Weather
//
//  Created by atom on 2022/8/8.
//
//

#import "FlexContainerExample.h"
#import "FlexItemContainer.h"

@interface FlexContainerExample ()
@property(nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) UIView *container;
@property(nonatomic, strong) UIStackView *cols;

@end

@implementation FlexContainerExample {
    UIEdgeInsets marginContainer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.container];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(12);
        make.right.equalTo(self.view).offset(-12);
    }];
    [self.container addSubview:self.cols];
    [self.cols addArrangedSubview:FlexItemContainer.new];
    [self.cols addArrangedSubview:FlexItemContainer.new];
    [self.cols addArrangedSubview:FlexItemContainer.new];
    [self.cols mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.container).offset(10);
        make.left.equalTo(self.container).offset(11);
        make.right.equalTo(self.container).offset(-11);
        make.bottom.equalTo(self.container).offset(-10);
    }];
}

- (void)initConfig {
    marginContainer = UIEdgeInsetsMake(0, 16, 0, 16);
}

#pragma mark - Getter


- (UIStackView *)cols{
    if (_cols==NULL) {
        _cols = UIStackView.new;
        _cols.axis = UILayoutConstraintAxisVertical;
        _cols.spacing = 5;
    }
    return _cols;
}
-(UIView *)container{
    if (_container == NULL) {
        _container = [[UIView alloc] init];
        _container.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
        _container.layer.cornerRadius = 16;
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
