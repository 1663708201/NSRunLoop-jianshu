//
//  main.m
//  TestServer
//
//  Created by zhangyaowu on 2018/2/8.
//  Copyright © 2018年 zhangyaowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        int handle = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        NSLog(@"-----程序运行到这里------");
        return handle;
    }
}
