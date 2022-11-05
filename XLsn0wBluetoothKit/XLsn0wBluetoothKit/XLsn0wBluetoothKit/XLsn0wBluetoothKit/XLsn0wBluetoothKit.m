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
#import "XLsn0wBluetoothKit.h"

@implementation XLsn0wBluetoothKit

/// Save the single instance
static XLsn0wBluetoothKit* sharedInstance = nil;
+ (XLsn0wBluetoothKit*)sharedInstance{
    // lazy instantiation
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initCBCentralManager];
    }
    return self;
}

#pragma mark - Custom functions
/**
 Initialize CBCentralManager instance
 */
-(void)initCBCentralManager{
    _connected         = false;
    _isConnecting      = false;
    _connectedServices = [NSMutableArray array];
    _notifCenter       = [NSNotificationCenter defaultCenter];
    NSDictionary *dic  = @{CBCentralManagerOptionShowPowerAlertKey:[NSNumber numberWithBool:false]};
    _manager = [[CBCentralManager alloc]
                initWithDelegate:self
                queue:nil
                options:dic];
 }
/**
 Singleton pattern method
 - returns: Bluetooth single instance
 */


/**
 The method provides for starting scan near by peripheral
 */
-(void)startScanPeripheral{
    [_manager scanForPeripheralsWithServices:nil options:@{CBCentralManagerScanOptionAllowDuplicatesKey:[NSNumber numberWithBool:true]}];
  // [_manager scanForPeripheralsWithServices:[NSArray arrayWithObject:[CBUUID UUIDWithString:@"1910"]] options:nil];
}
/**
 The method provides for stopping scan near by peripheral
 */
-(void)stopScanPeripheral{
    [_manager stopScan];
}
/**
 The method provides for connecting the special peripheral

 - parameter peripher: The peripheral you want to connect
 */
-(void)connectPeripheral:(CBPeripheral *)peripheral{
    if (!_isConnecting) {
        _isConnecting = true;
        [_manager connectPeripheral:peripheral options:@{CBConnectPeripheralOptionNotifyOnDisconnectionKey:[NSNumber numberWithBool:true]}];
        _timeoutMonitor = [NSTimer scheduledTimerWithTimeInterval:AUTO_CANCEL_CONNECT_TIMEOUT target:self selector:@selector(connectTimeout:) userInfo:peripheral repeats:false];
    }
}
/**
 The method provides for disconnecting with the peripheral which has connected
 */
-(void)disconnectPeripheral{
    if (_connectedPeripheral != nil) {
        [_manager cancelPeripheralConnection:_connectedPeripheral];
        [self startScanPeripheral];
        _connectedPeripheral = nil;
    }
}
/**
 The method provides for the user who want to obtain the descriptor

 - parameter characteristic: The character which user want to obtain descriptor
 */
-(void)discoverDescriptor:(CBCharacteristic *)characteristic{
    if (_connectedPeripheral != nil)  {
        [_connectedPeripheral discoverDescriptorsForCharacteristic:characteristic];
    }
}
/**
 The method is invoked when connect peripheral is timeout

 - parameter timer: The timer touch off this selector
 */
-(void)connectTimeout:(NSTimer *)timer{
    if (_isConnecting) {
        _isConnecting = false;
        CBPeripheral *peripheral = [timer userInfo];
        [self connectPeripheral:peripheral];
        _timeoutMonitor = nil;
    }
}
/**
 This method is invoked when interrogate peripheral is timeout

 - parameter timer: The timer touch off this selector
 */
-(void)integrrogateTimeout:(NSTimer *)timer{
    [self disconnectPeripheral];
    CBPeripheral *peripheral = [timer userInfo];
    if (_delegate && [(id)_delegate respondsToSelector:@selector(didFailedToInterrogate:)]) {
        [_delegate didFailedToInterrogate:peripheral];
    }
}
/**
 This method provides for discovering the characteristics.
 */
-(void)discoverCharacteristics{
    if (_connectedPeripheral == nil) {
        return;
    }
    NSArray<CBService *> *services =_connectedPeripheral.services;
    if (services == nil || services.count < 1 ){ // Validate service array
        return;
    }

    for (CBService *service in services){
        [_connectedPeripheral discoverCharacteristics:nil forService:service];
    }
}
/**
 Read characteristic value from the peripheral

 - parameter characteristic: The characteristic which user should
 */
-(void)readValueForCharacteristic:(CBCharacteristic *)characteristic{
    if (_connectedPeripheral == nil) {
        return;
    }
    [_connectedPeripheral readValueForCharacteristic:characteristic];
}
/**
 Start or stop listening for the value update action

 - parameter enable:         If you want to start listening, the value is true, others is false
 - parameter characteristic: The characteristic which provides notifications
 */
-(void)setNotification:(BOOL)enable forCharacteristic:(CBCharacteristic *)characteristic{
    if (_connectedPeripheral == nil) {
        XLsn0wLog(@"_connectedPeripheral === %@", _connectedPeripheral);
        return;
    }
    [_connectedPeripheral setNotifyValue:enable forCharacteristic:characteristic];
}
/**
 Write value to the peripheral which is connected

 - parameter data:           The data which will be written to peripheral
 - parameter characteristic: The characteristic information
 - parameter type:           The write of the operation
 */
-(void)writeValue:(NSData *)data forCharacteristic:(CBCharacteristic *)characteristic Type:(CBCharacteristicWriteType)type{
    if (_connectedPeripheral == nil) {
        return;
    }
    [_connectedPeripheral writeValue:data forCharacteristic:characteristic type:type];
}

- (void)writeHexString:(NSString *)hexString {
    if (_connectedPeripheral == nil) {
        return;
    }
    if (hexString.length == 0) {
        return;
    }
    [_connectedPeripheral writeValue:[self dataFromHexString:hexString]
                   forCharacteristic:self.writeCharacteristic
                                type:CBCharacteristicWriteWithResponse];
}

- (NSData *)dataFromHexString:(NSString *)string {
    string = [string lowercaseString];
    NSMutableData *data= [NSMutableData new];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i = 0;
    NSUInteger length = string.length;
    while (i < length-1) {
        char c = [string characterAtIndex:i++];
        if (c < '0' || (c > '9' && c < 'a') || c > 'f')
            continue;
        byte_chars[0] = c;
        byte_chars[1] = [string characterAtIndex:i++];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    return data;
}

#pragma mark - Delegate
/**
 Invoked whenever the central manager's state has been updated.
 */

- (void)centralManagerDidUpdateState:(nonnull CBCentralManager *)central {
    // Determine the state of the peripheral
    switch ([central state]) {
        case CBManagerStatePoweredOff:
             NSLog(@"State : Powered Off");
            break;
        case CBManagerStatePoweredOn:
            NSLog(@"State : Powered On");
            break;
        case CBManagerStateResetting:
            NSLog(@"State : Resetting");
            break;
        case CBManagerStateUnauthorized:
            NSLog(@"State : Unauthorized");
            break;
        case CBManagerStateUnknown:
            NSLog(@"State : Unknown");
            break;
        case CBManagerStateUnsupported:
            NSLog(@"State : Unsupported");
            break;
    }
    if (_delegate && [(id)_delegate respondsToSelector:@selector(didUpdateState:)]) {
        [_delegate didUpdateState:central];
    }
}
/**
 This method is invoked while scanning, upon the discovery of peripheral by central

 - parameter central:           The central manager providing this update.
 - parameter peripheral:        The discovered peripheral.
 - parameter advertisementData: A dictionary containing any advertisement and scan response data.
 - parameter RSSI:              The current RSSI of peripheral, in dBm. A value of 127 is reserved and indicates the RSSI
 *                                was not available.
 */
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI{
    //    NSLog(@"discover peripheral: %@; advertisementData: %@; RSSI: %@", peripheral, advertisementData, RSSI);
    //NSLog(@"Bluetooth Manager --> didDiscoverPeripheral:%@ RSSI:%@", peripheral.name, RSSI);

    if (_delegate && [(id)_delegate respondsToSelector:@selector(didDiscoverPeripheral:AdvertisementData:RSSI:)]) {
        [_delegate didDiscoverPeripheral:peripheral AdvertisementData:advertisementData RSSI:RSSI];
    }
 }
/**
 This method is invoked when a connection succeeded

 - parameter central:    The central manager providing this information.
 - parameter peripheral: The peripheral that has connected.
 */
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
    //NSLog(@"Bluetooth Manager --> didConnectPeripheral: %@",peripheral.name);
    _isConnecting  = false;
    if (_timeoutMonitor != nil) {
        [_timeoutMonitor invalidate];
        _timeoutMonitor = nil;
    }
    _connected = true;
    _connectedPeripheral = peripheral;

    if (_delegate && [(id)_delegate respondsToSelector:@selector(didConnectedPeripheral:)]) {
        [_delegate didConnectedPeripheral:peripheral];
    }
    [self stopScanPeripheral];
    peripheral.delegate = self;
    [peripheral discoverServices:nil];

    _interrogateMonitor = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(integrrogateTimeout:) userInfo:peripheral repeats:false];
}
/**
 This method is invoked where a connection failed.

 - parameter central:    The central manager providing this information.
 - parameter peripheral: The peripheral that you tried to connect.
 - parameter error:      The error infomation about connecting failed.
 */
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    //NSLog(@"Bluetooth Manager --> didFailToConnectPeripheral");
    _isConnecting = false;
    if (_timeoutMonitor != nil) {
        [_timeoutMonitor invalidate];
        _timeoutMonitor = nil;
    }
    _connected = false;
    if (_delegate && [(id)_delegate respondsToSelector:@selector(failToConnectPeripheral:Error:)]) {
        [_delegate failToConnectPeripheral:peripheral Error:error];
    }
  }
/**
 The method is invoked where services were discovered.

 - parameter peripheral: The peripheral with service informations.
 - parameter error:      Errot message when discovered services.
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{
    //NSLog(@"Bluetooth Manager --> didDiscoverServices");
    _connectedPeripheral = peripheral;
    if (error != nil) {
        //NSLog(@"Bluetooth Manager --> Discover Services Error, error:%@",error.localizedDescription);
        return ;
    }
    // If discover services, then invalidate the timeout monitor
    if (_interrogateMonitor != nil) {
        [_interrogateMonitor invalidate];
        _interrogateMonitor = nil;
    }

    if (_delegate && [(id)_delegate respondsToSelector:@selector(didDiscoverServices:)]) {
        [_delegate didDiscoverServices:peripheral];
    }
}
/**
 The method is invoked where characteristics were discovered.

 - parameter peripheral: The peripheral provide this information
 - parameter service:    The service included the characteristics.
 - parameter error:      If an error occurred, the cause of the failure.
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    //NSLog(@"Bluetooth Manager --> didDiscoverCharacteristicsForService");
    _connectedPeripheral = peripheral;
    if (error != nil) {
        //NSLog(@"Bluetooth Manager --> Fail to discover characteristics! Error:%@",error.localizedDescription);
        if (_delegate && [(id)_delegate respondsToSelector:@selector(didFailToDiscoverCharacteritics:)]) {
             [_delegate didFailToDiscoverCharacteritics:error];
        }
        return ;
    }
    if (_delegate && [(id)_delegate respondsToSelector:@selector(didDiscoverCharacteritics:)]) {
        [_delegate didDiscoverCharacteritics:service];
    }
  }
/**
 This method is invoked when the peripheral has found the descriptor for the characteristic

 - parameter peripheral:     The peripheral providing this information
 - parameter characteristic: The characteristic which has the descriptor
 - parameter error:          The error message
 */

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    //NSLog(@"Bluetooth Manager --> didDiscoverDescriptorsForCharacteristic");
    if (error != nil) {
        //NSLog(@"Bluetooth Manager --> Fail to discover descriptor for characteristic Error:%@",error.localizedDescription);
        if (_delegate && [(id)_delegate respondsToSelector:@selector(didFailToDiscoverDescriptors:)]) {
            [_delegate didFailToDiscoverDescriptors:error];
        }
        return;
    }
    if (_delegate && [(id)_delegate respondsToSelector:@selector(didDiscoverDescriptors:)]) {
        [_delegate didDiscoverDescriptors:characteristic];
    }
  }
/**
 This method is invoked when the peripheral has been disconnected.

 - parameter central:    The central manager providing this information
 - parameter peripheral: The disconnected peripheral
 - parameter error:      The error message
 */
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    //NSLog(@"Bluetooth Manager --> didDisconnectPeripheral");
    _connected = false;
    if (_delegate && [(id)_delegate respondsToSelector:@selector(didDisconnectPeripheral:)]) {
         [_delegate didDisconnectPeripheral:peripheral];
    }
    [_notifCenter postNotificationName:PeripheralNotificationKeys_DisconnectNotif object:self];
}
/**
 Thie method is invoked when the user call the peripheral.readValueForCharacteristic

 - parameter peripheral:     The periphreal which call the method
 - parameter characteristic: The characteristic with the new value
 - parameter error:          The error message
 */
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    //NSLog(@"Bluetooth Manager --> didUpdateValueForCharacteristic");
    if (error){
        //NSLog(@"Bluetooth Manager --> Failed to read value for the characteristic. Error:%@",error.localizedDescription);
        if (_delegate && [(id)_delegate respondsToSelector:@selector(didFailToReadValueForCharacteristic:)]) {
            [_delegate didFailToReadValueForCharacteristic:error];
        }
        return;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(didReadValueForCharacteristic:)]) {
        [_delegate didReadValueForCharacteristic:characteristic];
    }
 }

@end
