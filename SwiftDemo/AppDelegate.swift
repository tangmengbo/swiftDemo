//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by 唐蒙波 on 2020/5/25.
//  Copyright © 2020 Meng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    var tabbar : MainTabbar?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        
        let vc1 = FirstViewController()
        let nav1 = UINavigationController.init(rootViewController: vc1)
        
        let vc2 = BasicVC()
        let nav2 = UINavigationController.init(rootViewController: vc2)

        let vc3 = FirstViewController()
        let nav3 = UINavigationController.init(rootViewController: vc3)
        
        let array = [nav1,nav2,nav3]
        
        tabbar = MainTabbar.init()
        tabbar?.viewControllers = array
        
        self.window?.rootViewController = tabbar
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()

        
        return true
    }



}

