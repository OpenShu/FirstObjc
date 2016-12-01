//
//  AppDelegate.m
//  CAProject
//
//  Created by shubochao on 2016/12/1.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "AppDelegate.h"
#import "XYDataViewController.h"
#import "XYLayerViewController.h"
#import "XYThirdViewController.h"
#import "XYNetWorkViewController.h"
#import "XYCommonTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    
    XYCommonTabBarController *tab = [[XYCommonTabBarController alloc] init];
    self.window.rootViewController = tab;
    
    XYLayerViewController *layerViewController = [[XYLayerViewController alloc] init];
    XYDataViewController *dataViewController = [[XYDataViewController alloc] init];
    XYThirdViewController *thirdViewController = [[XYThirdViewController alloc] init];
    XYNetWorkViewController *netWorkViewController = [[XYNetWorkViewController alloc] init];
    
    XYCommonNavigationController *thirdNav = [[XYCommonNavigationController alloc] initWithRootViewController:thirdViewController];
    XYCommonNavigationController *dataNav = [[XYCommonNavigationController alloc] initWithRootViewController:dataViewController];
    XYCommonNavigationController *netNav = [[XYCommonNavigationController alloc] initWithRootViewController:netWorkViewController];
    XYCommonNavigationController *viewLayerNav = [[XYCommonNavigationController alloc] initWithRootViewController:layerViewController];
    tab.viewControllers = @[viewLayerNav,netNav,dataNav,thirdNav];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
