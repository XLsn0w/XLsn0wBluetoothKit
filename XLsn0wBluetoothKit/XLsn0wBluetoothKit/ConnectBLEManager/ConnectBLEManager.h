//
//  ConnectBLEManager.h
//  AirbagBed
//
//  Created by H3lix on 2022/9/13.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConnectBLEManager : NSObject

+ (instancetype)shared;
+ (void)invalid;
@property (nonatomic, assign) int type;

@property (copy, nonatomic) void (^ConnectBLEManagerPeripheralsBlock)(NSMutableArray *nearbyPeripherals);
@property (copy, nonatomic) void (^isConnectedPeripheralBlock)(BOOL isConnected);

@end

NS_ASSUME_NONNULL_END
