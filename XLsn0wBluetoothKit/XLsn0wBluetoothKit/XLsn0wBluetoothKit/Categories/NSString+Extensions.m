//
//  NSString+Extensions.m
//  Smart Chef Smart Food Scale
//
//  Created by Deepak Sharma on 30/10/18.
//  Copyright © 2018 ReFleXWireless. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)
- (void)enumerateCharactersUsingBlock:(void (^)(NSString *character, NSInteger idx, bool *stop))block
{
    bool _stop = NO;
    for(NSInteger i = 0; i < [self length] && !_stop; i++)
    {
        NSString *character = [self substringWithRange:NSMakeRange(i, 1)];
        block(character, i, &_stop);
    }
}
@end
