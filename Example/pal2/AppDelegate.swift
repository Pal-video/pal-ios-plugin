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
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    PalPlugin.sharedInstance.setup(apiToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwczovL2V4YW1wbGUuY29tL2lzc3VlciIsInVwbiI6IjQ4YzA4Mjk1LTdhNGEtNGE1Mi1hZDY0LWU5ZGYzYzU0ZDcyMUBwYWwuaW8iLCJzdWIiOiI0OGMwODI5NS03YTRhLTRhNTItYWQ2NC1lOWRmM2M1NGQ3MjEiLCJpYXQiOjE2NTkxMDI1MTcsImdyb3VwcyI6WyJQcm9qZWN0Il0sImVudiI6IkRFVkVMT1BNRU5UIiwiZXhwIjoxMDI5OTEwMjUxNywianRpIjoiOGI5MmQ3ODQtYjIwNC00OGNmLTk5MzktYmMzODY4OWU0ZDAxIn0.FlgtpgUm0GLklmwJ60QdX25wOmgIiNQadcAY5Yj209W0bv2JLCsHHrDwR-C4LG6n4ZsQOV0K8VXWkVJLJE_kjAyBTcbYssdpz0oJqnVMzuVy_AW0w87VM915LpmPSpyAVW5CVARyktRfIS-rVQ7_bz0l0BBkJUAreXbwQoUGSonkWeDFz1FD4AE82AwBu8WZ1K3_CLoI3-BRNyq1o4rFz8RaMGfOt2FhPdP0nTZ8HvujZxJZ0h0_PmsAanixTlIPAwfFPYndc__Xylj5Ah8MG9xU_m9_XqhMcMGKIKcQ4OcVbO66akEzJXugtUwl7wAazbyG0JLcpkgM1lV4fTiOuw", serverUrl: "https://stagingback.pal.video")
    
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

