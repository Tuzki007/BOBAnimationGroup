//
//  AppDelegate.m
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/9/26.
//  Copyright © 2019 张兴程. All rights reserved.
//  Bob = big orange brother （大橙哥）

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
//    NSDate *date = [formatter dateFromString:@"2019-11-01 23:12:45"];
    NSDate *date = [formatter dateFromString:@"2019-11-11"];

    NSInteger mini= [self isOutOfDateTimeWithFirstTime:date withCurrentTime:[self getCurrentTime]];
    NSLog(@"%ld",mini);
    
    return YES;
}

/**获取当前时间*/
- (NSDate *)getCurrentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
//    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:dateTime];
    return date;
}

/**判断是否是今天*/
- (NSInteger)isOutOfDateTimeWithFirstTime:(NSDate *)updateTime withCurrentTime:(NSDate *)currentTime
{
    //计算时间差间隔
    NSTimeInterval timeBetween = [currentTime timeIntervalSinceDate:updateTime];
    //根据相差的秒数，看是否大于7天
    NSInteger resultInterval = timeBetween/(24 * 3600);
    return resultInterval;
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
