
#import <CoreBluetooth/CoreBluetooth.h>
#import <objc/runtime.h>

@interface CBPeripheral (RSSI)

@property (nonatomic, strong) NSDictionary *advertisementData;
@property (nonatomic, strong) NSNumber *RSSINumber;
@property (nonatomic, copy) NSString *bluetoothName;

@end
