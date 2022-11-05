//
//  CBService+Additions.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "CBService+Additions.h"

@implementation CBService (Additions)
-(NSString *)name{
    NSString *strName = self.UUID.name;
    if (strName.length > 0) {
        return self.UUID.name;
    } else {
        return [NSString stringWithFormat:@"UUID: %@" ,self.UUID.UUIDString];
    }
}
@end
