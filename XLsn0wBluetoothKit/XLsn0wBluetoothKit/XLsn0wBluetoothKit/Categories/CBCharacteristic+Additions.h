//
//  CBCharacteristic+Additions.h
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import <CoreBluetooth/CoreBluetooth.h>
#import "CBUUID+Additions.h"
NS_ASSUME_NONNULL_BEGIN

@interface CBCharacteristic (Additions)
-(NSString *)name;
-(NSArray *)getProperties;
@end

NS_ASSUME_NONNULL_END
