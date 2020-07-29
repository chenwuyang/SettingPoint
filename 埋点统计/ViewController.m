//
//  ViewController.m
//  埋点统计
//
//  Created by lanshan on 2020/7/29.
//  Copyright © 2020 lanshan. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NextViewController *nextVC = [[NextViewController alloc] init];
    [self presentViewController:nextVC animated:YES completion:nil];
}


@end
