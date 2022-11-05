//
//  NSString+Extensions.h
//  Smart Chef Smart Food Scale
//
//  Created by Deepak Sharma on 30/10/18.
//  Copyright © 2018 ReFleXWireless. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extensions)
- (void)enumerateCharactersUsingBlock:(void (^)(NSString *character, NSInteger idx, bool *stop))block;
@end

NS_ASSUME_NONNULL_END
