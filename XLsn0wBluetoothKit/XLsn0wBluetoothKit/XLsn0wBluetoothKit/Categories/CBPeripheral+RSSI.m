
#import "CBPeripheral+RSSI.h"

@implementation CBPeripheral (RSSI)

char RSSIKey;

- (void)setRSSINumber:(NSNumber *)RSSINumber {
    objc_setAssociatedObject(self, &RSSIKey, RSSINumber, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSNumber *)RSSINumber {
    return objc_getAssociatedObject(self, &RSSIKey);
}

char advertisementDataKey;

- (void)setAdvertisementData:(NSDictionary *)advertisementData {
    objc_setAssociatedObject(self, &advertisementDataKey, advertisementData, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)advertisementData{
    return objc_getAssociatedObject(self, &advertisementDataKey);
}

char bluetoothNameKey;

- (void)setBluetoothName:(NSString *)bluetoothName {
    objc_setAssociatedObject(self, &bluetoothNameKey, bluetoothName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)bluetoothName {
    return objc_getAssociatedObject(self, &bluetoothNameKey);
}

@end
