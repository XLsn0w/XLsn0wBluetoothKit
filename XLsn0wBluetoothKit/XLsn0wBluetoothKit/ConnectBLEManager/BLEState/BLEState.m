//
//  HNGDevice.m
//  AirbagBed
//
//  Created by H3lix on 2022/9/13.
//

#import "BLEState.h"

@interface BLEState () <CBCentralManagerDelegate>

@property (nonatomic, strong) CBCentralManager *centralManager;

@end

@implementation BLEState

static id __singleton = nil;
static dispatch_once_t oncToken;
+ (instancetype)shared {
    dispatch_once(&oncToken, ^{
        __singleton = [[self.class alloc] init];
    });
    return __singleton;
}

+ (void)invalid {
    oncToken = 0;
    __singleton = nil;
}

- (instancetype)init {
    if ([super init]) {
        [self initCBCentralManager];
    }
    return self;
}

- (void)initCBCentralManager {
    _centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:@{CBCentralManagerOptionShowPowerAlertKey:[NSNumber numberWithBool:NO]}];
}

#pragma mark -- CBCentralManagerDelegate

- (void)centralManagerDidUpdateState:(CBCentralManager*)central {
    switch ([central state]) {
        case CBManagerStatePoweredOff:
            NSLog(@"蓝牙状态 --> BLEState 蓝牙关闭状态");
            [self showCenterMsg:@"请打开蓝牙来连接气囊床垫" duration:0.5];
            PostNotification(@"BLEDisConnected", nil);
            break;
        case CBManagerStatePoweredOn:
            NSLog(@"蓝牙状态 --> BLEState 蓝牙开启状态");
//            [self showCenterMsg:@"蓝牙已开启" duration:0.5];
//            PostNotification(@"BLEReConnected", nil);
            break;
        case CBManagerStateResetting:
            NSLog(@"蓝牙状态 --> BLEState : Resetting");
            break;
            
        case CBManagerStateUnauthorized:
            NSLog(@"蓝牙状态 --> BLEState : Unauthorized");
            [self showCenterMsg:@"请打开蓝牙授权"];

            break;
        case CBManagerStateUnknown:
            NSLog(@"蓝牙状态 --> BLEState : Unknown");

            break;
        case CBManagerStateUnsupported:
            NSLog(@"蓝牙状态 --> BLEState : Unsupported");

            break;
    }
}

@end
