//
//  AppDelegate.m
//  ESCNetStatusDemo
//
//  Created by xiatian on 2024/1/1.
//

#import "AppDelegate.h"
#import "Reachability/Reachability.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChange) name:kReachabilityChangedNotification object:nil];
    Reachability *connect = [Reachability reachabilityForInternetConnection];
    [connect startNotifier];
    NSLog(@"开始监听网络状态");
    return YES;
}

- (void)networkStateChange {
    
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reachability currentReachabilityStatus]) {

        case NotReachable:{
            NSLog(@"[Reachability Test]======No Network");
        }
        case ReachableViaWiFi:{
            NSLog(@"[Reachability Test]======WI-FI Network");
        }
            break;
        case ReachableViaWWAN:{
            NSLog(@"[Reachability Test]======Cellular Network");
        }
            break;
        default:
            break;
    }
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
