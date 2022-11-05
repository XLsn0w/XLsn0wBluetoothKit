/*********************************************************************************************
 *   __      __   _         _________     _ _     _    _________   __         _         __   *
 *   \ \    / /  | |        | _______|   | | \   | |  |  ______ |  \ \       / \       / /   *
 *    \ \  / /   | |        | |          | |\ \  | |  | |     | |   \ \     / \ \     / /    *
 *     \ \/ /    | |        | |______    | | \ \ | |  | |     | |    \ \   / / \ \   / /     *
 *     /\/\/\    | |        |_______ |   | |  \ \| |  | |     | |     \ \ / /   \ \ / /      *
 *    / /  \ \   | |______   ______| |   | |   \ \ |  | |_____| |      \ \ /     \ \ /       *
 *   /_/    \_\  |________| |________|   |_|    \__|  |_________|       \_/       \_/        *
 *                                                                                           *
*********XLsn0w*******************************************************************************/
#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "CBUUID+Additions.h"
#import "CBService+Additions.h"
#import "CBCharacteristic+Additions.h"

#define AUTO_CANCEL_CONNECT_TIMEOUT 2
#define PeripheralNotificationKeys_DisconnectNotif @"disconnectNotif"
#define PeripheralNotificationKeys_CharacteristicNotif @"characteristicNotif"

#define kBluetoothKit [XLsn0wBluetoothKit sharedInstance]

@protocol XLsn0wBluetoothDelegate <NSObject>

@optional
/**
 The callback function when the bluetooth has updated.

 - parameter state: The newest state
 */
- (void)didUpdateState:(CBCentralManager *)central;
/**
 The callback function when peripheral has been found.

 - parameter peripheral:        The peripheral has been found.
 - parameter advertisementData: The advertisement data.
 - parameter RSSI:              The signal strength.
 */
- (void)didDiscoverPeripheral:(CBPeripheral *)peripheral
            AdvertisementData:(NSDictionary *)advertisementData
                         RSSI:(NSNumber *)rssi;

/**
 The callback function when central manager connected the peripheral successfully.

 - parameter connectedPeripheral: The peripheral which connected successfully.
 */
-(void)didConnectedPeripheral:(CBPeripheral *)connectedPeripheral;
/**
 The callback function when central manager failed to connect the peripheral.

 - parameter connectedPeripheral: The peripheral which connected failure.
 - parameter error:               The connected failed error message.
 */
-(void)failToConnectPeripheral:(CBPeripheral *)peripheral Error:(NSError *)error;
/**
 The callback function when the services has been discovered.

 - parameter peripheral: Peripheral which provide this information and contain services information
 */
-(void)didDiscoverServices:(CBPeripheral *)peripheral;
/**
 The callback function when the peripheral disconnected.

 - parameter peripheral: The peripheral which provide this action
 */
-(void)didDisconnectPeripheral:(CBPeripheral *)peripheral;
/**
 The callback function when interrogate the peripheral is timeout

 - parameter peripheral: The peripheral which is failed to discover service
 */
-(void)didFailedToInterrogate:(CBPeripheral *)peripheral;
/**
 The callback function when discover characteritics successfully.

 - parameter service: The service information include characteritics.
 */
-(void)didDiscoverCharacteritics:(CBService *)service;
/**
 The callback function when discover characteritics successfully.

 - parameter service: The service information include characteritics.
 */
-(void)didFailToDiscoverCharacteritics:(NSError *)error;
/**
 The callback function when discover descriptor for characteristic successfully

 - parameter characteristic: The characteristic which has the descriptor
 */
-(void)didDiscoverDescriptors:(CBCharacteristic *)characteristic;
/**
 The callback function when failed to discover descriptor for characteristic

 - parameter error: The error message
 */
-(void)didFailToDiscoverDescriptors:(NSError *)error;

/**
 The callback function invoked when peripheral read value for the characteristic successfully

 - parameter characteristic: The characteristic withe the value
 */
-(void)didReadValueForCharacteristic:(CBCharacteristic *)characteristic;

/**
 The callback function invoked when failed to read value for the characteristic

 - parameter error: The error message
 */
-(void)didFailToReadValueForCharacteristic:(NSError *)error;

@end

@interface XLsn0wBluetoothKit : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate>

+(XLsn0wBluetoothKit *)sharedInstance;

@property (strong,nonatomic) CBCentralManager *manager;
@property (strong, nonatomic) id<XLsn0wBluetoothDelegate> delegate;

@property (nonatomic) BOOL connected;
@property (strong,nonatomic) NSTimer *timeoutMonitor; /// Timeout monitor of connect to peripheral
@property (strong,nonatomic) NSTimer * interrogateMonitor ; /// Timeout monitor of interrogate the peripheral
@property (strong,nonatomic) NSNotificationCenter *notifCenter;
@property (nonatomic) BOOL isConnecting;
@property (strong,nonatomic) NSString *logs;
@property (strong,nonatomic) CBPeripheral *connectedPeripheral;
@property (strong,nonatomic) NSMutableArray *connectedServices;

//写数据特征值
@property (nonatomic, strong) CBCharacteristic *writeCharacteristic;
//读数据特征值
@property (nonatomic, strong) CBCharacteristic *readCharacteristic;

-(void)startScanPeripheral;
-(void)stopScanPeripheral;
-(void)disconnectPeripheral;
-(void)discoverCharacteristics;
-(void)connectPeripheral:(CBPeripheral *)peripheral;
-(void)discoverDescriptor:(CBCharacteristic *)characteristic;
-(void)setNotification:(BOOL)enable forCharacteristic:(CBCharacteristic *)characteristic;
-(void)readValueForCharacteristic:(CBCharacteristic *)characteristic;
-(void)writeValue:(NSData *)data forCharacteristic:(CBCharacteristic *)characteristic Type:(CBCharacteristicWriteType)type;
- (void)writeHexString:(NSString *)hexString;


@end


