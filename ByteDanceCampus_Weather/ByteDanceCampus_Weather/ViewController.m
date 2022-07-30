//
//  ViewController.m
//  ByteDanceCampus_Weather
//
//  Created by 宋开开 on 2022/7/22.
//

#import "ViewController.h"

#import "IGListKit.h"

@interface ViewController () <
    IGListAdapterDataSource,
    CLLocationManagerDelegate
>

@property (nonatomic, strong) UIView *currentView;

@property (nonatomic, strong) UIImageView *backgroundImgView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) NSMutableArray *objects;

/// 按钮
@property (nonatomic, strong) UIButton *btn;

@end

#import "DaylyWeather.h"

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.greenColor;
    
    [self.view addSubview:self.btn];
    
}

- (void)test {
    
    NSString *str = [RisingJWT tokenWithAuto:YES];
    
    
    RisingLog(R_success, @"%@", str);
    
    RisingLog(R_success, @"%@", NSTimeZone.systemTimeZone.name);
    
    DaylyWeather *a = [[DaylyWeather alloc] init];
    [a test];
}

- (void)push {
    UIViewController *vc = [self.router controllerForRouterPath:@"test"];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

#pragma mark - Method

// MARK: SEL

#pragma mark - Getter

- (UIButton *)btn {
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 80, 80)];
        _btn.backgroundColor = UIColor.redColor;
        [_btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (UIView *)currentView {
    if (_currentView == nil) {
        _currentView = [[UIView alloc] initWithFrame:self.view.bounds];
        _currentView.backgroundColor = UIColor.orangeColor;
    }
    return _currentView;
}

- (UIImageView *)backgroundImgView {
    if (_backgroundImgView == nil) {
        _backgroundImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];    }
    return _backgroundImgView;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.SuperFrame collectionViewLayout:layout];
        _collectionView.backgroundColor = UIColor.greenColor;
        _collectionView.pagingEnabled = YES;
    }
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (_adapter == nil) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
        _adapter.dataSource = self;
        _adapter.collectionView = self.collectionView;
    }
    return _adapter;
}

#pragma mark - IGListAdapterDataSource

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return self.backgroundImgView;
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.objects;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return (IGListSectionController *)[self.router sourceForRouterPath:@"CitySection"];
}

#pragma mark - RisingRouterHandler

+ (NSArray<NSString *> *)routerPath {
    return @[
        @"main"
    ];
}

+ (void)responseRequest:(RisingRouterRequest *)request completion:(RisingRouterResponseBlock)completion {
    
    RisingRouterResponse *response = [[RisingRouterResponse alloc] init];
    
    switch (request.requestType) {
        case RouterRequestPush: {
            
            UINavigationController *nav = (request.requestController ? request.requestController : RisingRouterRequest.useTopController).navigationController;
            
            if (nav) {
                ViewController *vc = [[self alloc] init];
                response.responseController = vc;
                
                [nav pushViewController:vc animated:YES];
            } else {
                
                response.errorCode = RouterResponseWithoutNavagation;
            }
            
        } break;
            
        case RouterRequestParameters: {
            // TODO: 传回参数
        } break;
            
        case RouterRequestController: {
            
            ViewController *vc = [[self alloc] init];
            
            response.responseController = vc;
        } break;
    }
    
    if (completion) {
        completion(response);
    }
}

@end
