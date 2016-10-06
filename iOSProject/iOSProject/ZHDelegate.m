//
//  ZHDelegate.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 12.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHDelegate.h"

#import "ZHSimpleViewContoller.h"
#import "ZHTableViewController.h"
#import "ZHTestViewController.h"

@interface ZHDelegate ()

@end

@implementation ZHDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;

//    ZHSimpleViewContoller *controler = [ZHSimpleViewContoller new];
    ZHTableViewController *controller = [ZHTableViewController new];
    
//    ZHTestViewController *controller = [ZHTestViewController new];

    window.rootViewController = controller;

    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
