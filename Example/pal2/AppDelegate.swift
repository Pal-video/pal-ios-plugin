//
//  AppDelegate.swift
//  pal2
//
//  Created by istornz on 11/15/2022.
//  Copyright (c) 2022 istornz. All rights reserved.
//

import UIKit
import pal2

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    PalPlugin.sharedInstance.initialize(apiToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwczovL2V4YW1wbGUuY29tL2lzc3VlciIsInVwbiI6IjQ4YzA4Mjk1LTdhNGEtNGE1Mi1hZDY0LWU5ZGYzYzU0ZDcyMUBwYWwuaW8iLCJzdWIiOiI0OGMwODI5NS03YTRhLTRhNTItYWQ2NC1lOWRmM2M1NGQ3MjEiLCJpYXQiOjE2NTkxMDI1MTcsImdyb3VwcyI6WyJQcm9qZWN0Il0sImVudiI6IlBST0RVQ1RJT04iLCJleHAiOjEwMjk5MTAyNTE3LCJqdGkiOiIwODA1YzZkMC00NTNjLTRjODMtYjRjYi1iZGJhYTJlNWFlNDUifQ.OyUO1c0GPQU-dHle_L03PWZUE08y8tSZEOH1wI9MWbmJwXEbOtO8LUe0cl5owgr3Aw9R9r-23BywGj3p7VzukxBZ2ZG07Y30dOld4uWg-UZCKpmmAu6eF8t_DXdCq17_qicjbjhym_c-lQd0hvoqaLOcquoBm33d9wh5kriUgMw7ttfAMr7P3CScADUlfeQSIK0TeCF7dt6br1qqFb1FQWFRKnWZQ9aBF3Bc_euua6T4Fu4O44Jty36MaLa6pBXJf1AavTihm8fh0DHe8WIrNjfXdHenRQYN-CXQWcBpMGCGV0EiciMblkU2kyp3gO4X_e1zIasdSQ9Xdzf1TsH3fQ", serverUrl: "https://stagingback.pal.video")
    
    return true
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}

