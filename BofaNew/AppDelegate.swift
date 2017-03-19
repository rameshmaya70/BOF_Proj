//
//  AppDelegate.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 2/24/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var timer:NSTimer = NSTimer()
    var notifFired:Bool = false
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        askNotifPermission()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
       
        startTimerForLocalNotif()
        self.notifFired = true
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        NSNotificationCenter.defaultCenter().postNotificationName("appLaunched", object: nil)
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        if application.applicationState == UIApplicationState.Background || application.applicationState == UIApplicationState.Inactive{
            stopTimer()
            
        }else if application.applicationState == UIApplicationState.Active{
            
        }
        
    }
    
    //MARK:Notifcation methods
    
    func askNotifPermission(){
        let notificationTypes: UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Sound]
        
        let notifSettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notifSettings)
    }
    
    
    func startTimerForLocalNotif(){
       timer =  NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: "fireNotif", userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        timer.invalidate()
    }
    func fireNotif(){
        let localNotif:UILocalNotification = UILocalNotification()
        let now:NSDate = NSDate()
        let fireDate:NSDate = now.dateByAddingTimeInterval(5)
        localNotif.fireDate = fireDate
        localNotif.timeZone = NSTimeZone.defaultTimeZone()
        localNotif.alertBody = "Slide to Bofa"
        UIApplication.sharedApplication().scheduleLocalNotification(localNotif)
    }
}

