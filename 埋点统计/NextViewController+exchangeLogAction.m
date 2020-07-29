//
//  NextViewController+exchangeLogAction.m
//  埋点统计
//
//  Created by lanshan on 2020/7/29.
//  Copyright © 2020 lanshan. All rights reserved.
//

#import "NextViewController+exchangeLogAction.h"
#import "SMHook.h"

@implementation NextViewController (exchangeLogAction)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL fromSelector = @selector(logAction);
        SEL toSelector = @selector(hook_logAction);
        [SMHook hookClass:self fromSelector:fromSelector toSelector:toSelector];
    });
}

- (void)hook_logAction
{
    [self insertTologAction];
    [self hook_logAction];
}

- (void)insertTologAction
{
    NSLog(@"666666666");
}

@end
