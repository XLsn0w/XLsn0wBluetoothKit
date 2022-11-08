//
//  ConnectBLEManager.h
//  AirbagBed
//
//  Created by H3lix on 2022/9/13.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

// 设置蓝牙的前缀【开发者必须改为自己的蓝牙设备前缀】
#define BLEDevicePrefix     @"iAirBagBed"
#define UUID_Service_always @"6E400020-B5A3-F393-E0A9-E50E24DCCA9E"
#define UUID_Write_always   @"6E400022-B5A3-F393-E0A9-E50E24DCCA9E"
#define UUID_Notify_always  @"6E400022-B5A3-F393-E0A9-E50E24DCCA9E"

#define UUID_Service        @"6E400025-B5A3-F393-E0A9-E50E24DCCA9E"
#define UUID_Write          @"6E400026-B5A3-F393-E0A9-E50E24DCCA9E"
#define UUID_Notify         @"6E400027-B5A3-F393-E0A9-E50E24DCCA9E"

NS_ASSUME_NONNULL_BEGIN

@interface ConnectBLEManager : NSObject

+ (instancetype)shared;
+ (void)invalid;
@property (nonatomic, assign) int type;

@property (copy, nonatomic) void (^ConnectBLEManagerPeripheralsBlock)(NSMutableArray *nearbyPeripherals);
@property (copy, nonatomic) void (^isConnectedPeripheralBlock)(BOOL isConnected);

@end

NS_ASSUME_NONNULL_END
