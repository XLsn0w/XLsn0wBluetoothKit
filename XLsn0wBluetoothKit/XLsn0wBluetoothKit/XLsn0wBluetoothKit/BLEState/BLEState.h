//
//  HNGDevice.h
//  AirbagBed
//
//  Created by H3lix on 2022/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLEState : NSObject

+ (instancetype)shared;
+ (void)invalid;

@end

NS_ASSUME_NONNULL_END
