//
//  SMHook.h
//  埋点统计
//
//  Created by lanshan on 2020/7/29.
//  Copyright © 2020 lanshan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMHook : NSObject
+ (void)hookClass:(Class)classObject fromSelector:(SEL)fromSelector toSelector:(SEL)toSelector;
@end

NS_ASSUME_NONNULL_END
