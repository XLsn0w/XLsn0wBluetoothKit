//
//  ConnectBLEManager.m
//  AirbagBed
//
//  Created by H3lix on 2022/9/13.
//  MTU 在连接过程中协商。iOS 将自动使用两个设备支持的最大值。iOS 最多支持 185

#import "ConnectBLEManager.h"
#import "XLsn0wBluetoothKit.h"
#import "CBPeripheral+RSSI.h"

@interface ConnectBLEManager () <XLsn0wBluetoothDelegate>

@property (strong, nonatomic) NSMutableArray <CBPeripheral*> *nearbyPeripherals;

@end

@implementation ConnectBLEManager

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
        [self initConfig];
    }
    return self;
}

- (void)initConfig {
    self.nearbyPeripherals = [NSMutableArray array];
    kBluetoothKit.delegate = self;
}

#pragma mark - BluetoothDelegate
/**
   检测蓝牙状态

 - parameter state: The bluetooth state
 */
- (void)didUpdateState:(CBCentralManager *)central {
    switch ([central state]) {
        case CBManagerStatePoweredOff:
            NSLog(@"蓝牙关闭状态");
            [kBluetoothKit stopScanPeripheral];
            [kBluetoothKit disconnectPeripheral];

            break;
        case CBManagerStatePoweredOn:
            NSLog(@"蓝牙开启状态");
            [kBluetoothKit startScanPeripheral];
            
            break;
            
        case CBManagerStateResetting:
            NSLog(@"蓝牙状态 --> State : Resetting");
            break;
            
        case CBManagerStateUnauthorized:
            NSLog(@"蓝牙状态 --> State : Unauthorized");
            [kBluetoothKit stopScanPeripheral];
            [kBluetoothKit disconnectPeripheral];

            break;
        case CBManagerStateUnknown:
            NSLog(@"蓝牙状态 --> State : Unknown");
            [kBluetoothKit stopScanPeripheral];
            [kBluetoothKit disconnectPeripheral];

            break;
        case CBManagerStateUnsupported:
            NSLog(@"蓝牙状态 --> State : Unsupported");
            [kBluetoothKit stopScanPeripheral];
            [kBluetoothKit disconnectPeripheral];

            break;
    }
}

- (void)didDiscoverPeripheral:(CBPeripheral *)peripheral
            AdvertisementData:(NSDictionary *)advertisementData
                         RSSI:(NSNumber *)RSSI {
    
    for (CBPeripheral *model in self.nearbyPeripherals) {
        if ([model.name isEqualToString:peripheral.name] ||
            peripheral.name.length == 0) {
            return;
        }
    }
    peripheral.bluetoothName = advertisementData[CBAdvertisementDataLocalNameKey];
    peripheral.advertisementData = advertisementData;
    peripheral.RSSINumber = RSSI;
    if ([peripheral.bluetoothName containsString:BLEDevicePrefix]) {
        [self.nearbyPeripherals addObject:peripheral];
    }
    if (self.ConnectBLEManagerPeripheralsBlock) {
        self.ConnectBLEManagerPeripheralsBlock(self.nearbyPeripherals);
    }
}

// 蓝牙连接成功
- (void)didConnectedPeripheral:(CBPeripheral *)connectedPeripheral {
    //[[DLProgressHUD shareManager] dismissWithTime:0];
    if (self.type == 1) {
        //[self showCenterMsg:@"连接成功" duration:0.5];
    }
//    if (kConnected) {
        if (self.isConnectedPeripheralBlock) {
            self.isConnectedPeripheralBlock(YES);
        }
        [kBluetoothKit discoverCharacteristics];
//    }
}

/** 发现蓝牙服务
 The peripheral services monitor

 - parameter services: The service instances which discovered by CoreBluetooth
 */
- (void)didDiscoverServices:(CBPeripheral *)peripheral {
//    if (kConnected) {
//        if (self.isConnectedPeripheralBlock) {
//            self.isConnectedPeripheralBlock(YES);
//        }
//        [kBluetoothKit discoverCharacteristics];
//    }
}

// 连接后断开
- (void)didDisconnectPeripheral:(CBPeripheral *)peripheral {
    //[[DLProgressHUD shareManager] dismissWithTime:0];
    if (self.isConnectedPeripheralBlock) {
        self.isConnectedPeripheralBlock(NO);
    }
//    if (kUser.deviceId.length > 0) {
//        [self showCenterMsg:@"蓝牙连接已断开"];
//        PostNotification(@"BLEDisConnected", nil);
//        PostNotification(@"BLEReConnected", nil);
//    }
}

// 发现特征 service.UUID Characteristic.UUID
- (void)didDiscoverCharacteritics:(CBService *)service {
    NSArray* services = kBluetoothKit.connectedPeripheral.services;
//    XLsn0wLog(@"services === %@", services);
    
    for (CBService* service in services) {
        NSString *service_UUID = [NSString stringWithFormat:@"%@", service.UUID];
        
        if ([service_UUID isEqualToString:UUID_Service]) {// 找到需要传输的Service
            NSArray *characteristics = service.characteristics;
            NSLog(@"service.characteristics == %@", characteristics);
            for (CBCharacteristic *currentCharacteristic in characteristics) {
                [self set_writeCharacteristic:currentCharacteristic];// 写数据的特征值
                [self set_readCharacteristic:currentCharacteristic]; // 读数据的特征值
            }
        }
    }
    
    for (CBService* service in services) {
        NSString *service_UUID = [NSString stringWithFormat:@"%@", service.UUID];
        
        if ([service_UUID isEqualToString:UUID_Service_always]) {// 找到需要传输的Service
            NSArray *characteristics = service.characteristics;
            NSLog(@"service.characteristics == %@", characteristics);
            for (CBCharacteristic *currentCharacteristic in characteristics) {
//                [self set_writeCharacteristic:currentCharacteristic];// 写数据的特征值
                [self set_always_readCharacteristic:currentCharacteristic]; // 读数据的特征值
            }
        }
    }
}

- (void)set_always_readCharacteristic:(CBCharacteristic*)currentCharacteristic {
    // 读数据的特征值
    NSString *currentCharacteristic_UUID = [NSString stringWithFormat:@"%@", currentCharacteristic.UUID];
    if ([currentCharacteristic_UUID isEqualToString:UUID_Notify_always]) {
//        kBLEManager.readCharacteristic = currentCharacteristic;
        [kBluetoothKit readValueForCharacteristic:currentCharacteristic];
        [kBluetoothKit setNotification:YES forCharacteristic:currentCharacteristic];
        NSLog(@"读数据的特征值 readCharacteristic = %@", currentCharacteristic);
    }
}

- (void)set_writeCharacteristic:(CBCharacteristic*)currentCharacteristic {
    // 写数据的特征值
    NSString *currentCharacteristic_UUID = [NSString stringWithFormat:@"%@", currentCharacteristic.UUID];
    if ([currentCharacteristic_UUID isEqualToString:UUID_Write]) {
        kBluetoothKit.writeCharacteristic = currentCharacteristic;
        [kBluetoothKit setNotification:YES forCharacteristic:currentCharacteristic];
        NSLog(@"写数据的特征值 writeCharacteristic = %@", currentCharacteristic);
    }
}

- (void)set_readCharacteristic:(CBCharacteristic*)currentCharacteristic {
    // 读数据的特征值
    NSString *currentCharacteristic_UUID = [NSString stringWithFormat:@"%@", currentCharacteristic.UUID];
    if ([currentCharacteristic_UUID isEqualToString:UUID_Notify]) {
        kBluetoothKit.readCharacteristic = currentCharacteristic;
        [kBluetoothKit readValueForCharacteristic:currentCharacteristic];
        [kBluetoothKit setNotification:YES forCharacteristic:currentCharacteristic];
        NSLog(@"读数据的特征值 readCharacteristic = %@", currentCharacteristic);
    }
}

// 读取蓝牙设备返回的数据NSData *value = characteristic.value;
- (void)didReadValueForCharacteristic:(CBCharacteristic *)characteristic {
//    PostNotification(@"didReadValueForCharacteristic", characteristic.value);
}

@end
