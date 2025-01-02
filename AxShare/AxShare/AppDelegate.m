//
//  AppDelegate.m
//  AxShare
//
//  Created by 苏宝敬 on 2025/1/1.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    self.window.backgroundColor = [UIColor whiteColor];
    MainViewController *Con = [[MainViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Con];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
