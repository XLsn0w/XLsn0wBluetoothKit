//
//  CBCharacteristic+Additions.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "CBCharacteristic+Additions.h"

@implementation CBCharacteristic (Additions)
/// Obtain the name of the characteristic according to the UUID, if the UUID is the standard defined in the `Bluetooth Developer Portal` then return the name
-(NSString *)name{
    NSString *strName = self.UUID.name;
    if (strName.length > 0 ) {
        return self.UUID.name;
    } else {
        return [NSString stringWithFormat:@"0x%@" , self.UUID.UUIDString];
    }
    return strName;
}
/**
 Obtain the properties string array according to the `self.properties`.
 */
-(NSArray *)getProperties{
    NSMutableArray *resultProperties = [NSMutableArray array];
    CBCharacteristicProperties properties = self.properties;


    if ((properties & CBCharacteristicPropertyBroadcast) > 0) {
        [resultProperties addObject:@"Broadcast"];
    }
    if ((properties & CBCharacteristicPropertyRead) > 0) {
        [resultProperties addObject:@"Read"];
    }
    if ((properties & CBCharacteristicPropertyWrite ) > 0) {
        [resultProperties addObject:@"Write"];
    }
    if ((properties & CBCharacteristicPropertyWriteWithoutResponse) > 0) {
        [resultProperties addObject:@"Write Without Response"];
    }
    if ((properties & CBCharacteristicPropertyNotify ) > 0) {
        [resultProperties addObject:@"Notify"];
    }
    if ((properties & CBCharacteristicPropertyIndicate ) > 0) {
        [resultProperties addObject:@"Indicate"];
    }
    if ((properties & CBCharacteristicPropertyAuthenticatedSignedWrites ) > 0) {
        [resultProperties addObject:@"Authenticated Signed Writes"];
    }
    if ((properties & CBCharacteristicPropertyExtendedProperties ) > 0) {
       [resultProperties addObject:@"Extended Properties"];
    }
    if ((properties & CBCharacteristicPropertyNotifyEncryptionRequired ) > 0) {
        [resultProperties addObject:@"Notify Encryption Required"];
    }
    if ((properties & CBCharacteristicPropertyIndicateEncryptionRequired ) > 0) {
        [resultProperties addObject:@"Indicate Encryption Required"];
    }
    return resultProperties;
}
@end
