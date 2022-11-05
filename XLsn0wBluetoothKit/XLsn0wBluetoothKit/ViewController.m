//
//  ViewController.m
//  XLsn0wBluetoothKit
//
//  Created by H3lix on 2022/11/5.
//

#import "ViewController.h"
#import "ConnectBLEManager.h"
#import "XLsn0wBluetoothKit.h"
#import "CBPeripheral+RSSI.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray <CBPeripheral*> *nearbyPeripherals;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self reloadBLE];
    
    self.nearbyPeripherals = [NSMutableArray array];
    ConnectBLEManager.shared.type = 0;
    ConnectBLEManager.shared.ConnectBLEManagerPeripheralsBlock = ^(NSMutableArray * _Nonnull nearbyPeripherals) {
        self.nearbyPeripherals = nearbyPeripherals;
        if (self.nearbyPeripherals.count > 0) {
//            self.tableView.hidden = NO;
//            [self.tableView reloadData];
        }
    };
    ConnectBLEManager.shared.isConnectedPeripheralBlock = ^(BOOL isConnected) {
        if (isConnected) {
//            self.connectingBLEView.hidden = YES;
//            self.connectBLESuccessView.hidden = NO;
        } else {
            
        }
    };
}

- (void)reloadBLE {
    [kBluetoothKit disconnectPeripheral];
    [kBluetoothKit stopScanPeripheral];
    [kBluetoothKit startScanPeripheral];
//    [self.tableView reloadData];
}

- (void)connectDevice {
    
    CBPeripheral *peripheral = _nearbyPeripherals[0];
//    kUser.deviceId = peripheral.bluetoothName;
    [kBluetoothKit connectPeripheral:peripheral];// 连接蓝牙
    [kBluetoothKit stopScanPeripheral];
    
    NSLog(@"advertisementData === %@", peripheral.advertisementData);
    NSData* kCBAdvDataManufacturerData = peripheral.advertisementData[@"kCBAdvDataManufacturerData"];
    Byte* bytes = [kCBAdvDataManufacturerData bytes];
    uint8_t type = bytes[4];
    if (type == 0x01) {// 0x01代表单人床，0x02代表双人床
//        kUser.bedType = 1;
//        XLsn0wLog(@"单人床 === %x", type);
    } else {
//        kUser.bedType = 2;
//        XLsn0wLog(@"双人床 === %x", type);
    }
}

@end
