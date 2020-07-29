//
//  UIViewController+Logger.m
//  埋点统计
//
//  Created by lanshan on 2020/7/29.
//  Copyright © 2020 lanshan. All rights reserved.
//可以看到，Category 在 +load() 方法里使用了 SMHook 进行方法替换，在替换的方法里执行需要埋点的方法 [self insertToViewWillAppear]。这样的话，每个 UIViewController 生命周期到了 ViewWillAppear 时都会去执行 insertToViewWillAppear 方法。那么，我们要怎么区别不同的 UIViewController 呢？我一般采取的做法都是，使用 NSStringFromClass([self class]) 方法来取类名。这样，我就能够通过类名来区别不同的 UIViewController 了。

#import "UIViewController+Logger.h"
#import "SMHook.h"

@implementation UIViewController (Logger)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         // 通过 @selector 获得被替换和替换方法的 SEL，作为 SMHook:hookClass:fromeSelector:toSelector 的参数传入
        SEL fromSelectorAppear = @selector(viewWillAppear:);
        SEL toSelectorAppear = @selector(hook_viewWillAppear:);
        [SMHook hookClass:self fromSelector:fromSelectorAppear toSelector:toSelectorAppear];
        
        SEL fromSelectorDisappear = @selector(viewWillDisappear:);
        SEL toSelectorDisappear = @selector(hook_viewWillDisappear:);
        [SMHook hookClass:self fromSelector:fromSelectorDisappear toSelector:toSelectorDisappear];
    });
}


- (void)hook_viewWillAppear:(BOOL)animated
{
     // 先执行插入代码，再执行原 viewWillAppear 方法
    [self insertToViewWillAppear];
    [self hook_viewWillAppear:animated];
}

- (void)hook_viewWillDisappear:(BOOL)animated
{
     // 执行插入代码，再执行原 viewWillDisappear 方法
    [self insertToViewWillDisAppear];
    [self hook_viewWillDisappear:animated];
}

- (void)insertToViewWillAppear
{
     // 在 ViewWillAppear 时进行日志的埋点
    NSLog(@"=====%@",NSStringFromClass([self class]));
}

- (void)insertToViewWillDisAppear
{
     // 在 ViewWillDisappear 时进行日志的埋点
}


@end
