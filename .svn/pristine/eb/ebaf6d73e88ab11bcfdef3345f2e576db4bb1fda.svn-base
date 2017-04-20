//
//  AppDelegate.swift
//  PMV_GoldSoftware
//
//  Created by PMV-MACMINI on 12/26/16.
//  Copyright © 2016 Ha.Nguyen. All rights reserved.
//

import UIKit
import FacebookCore
import Google
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , SWRevealViewControllerDelegate {

    var window: UIWindow?
    var viewController  = SWRevealViewController()
    var navDelegate : UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        self.initializeScreenSettings()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let frontViewController:ProductViewController = ProductViewController()
        let rearViewController : SidebarViewController = SidebarViewController()
        let frontNavigationController = UINavigationController.init(rootViewController: rearViewController)
        let rearNavigationController = UINavigationController.init(rootViewController:frontViewController )
        let revealController = SWRevealViewController.init(rearViewController: frontNavigationController, frontViewController: rearNavigationController)
        revealController?.delegate = self
        self.viewController = revealController!;
        self.window!.rootViewController = self.viewController
        self.window?.makeKeyAndVisible()
        
        // SDK facebook
        
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    
    
    //MARK: Google delegete || Facebook Delegate
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        let FBLogin =  SDKApplicationDelegate.shared.application(application, open: url, options: options)
        let GGLogin =  GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        return FBLogin || GGLogin
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        AppEventsLogger.activate(application)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func initializeScreenSettings() {
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundImage(for: UIBarMetrics.default)
        UINavigationBar.appearance().backgroundImage(for: UIBarPosition.top, barMetrics: UIBarMetrics.default)
        
        
    }
}

