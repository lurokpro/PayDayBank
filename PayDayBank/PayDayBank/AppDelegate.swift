//
//  AppDelegate.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 06.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = SignInVC()
        let navigationVC = storyboard.instantiateViewController(withIdentifier: "MainNavigationVCID") as! UINavigationController
        navigationVC.pushViewController(signInVC, animated: true)
        window!.rootViewController = navigationVC
        window!.makeKeyAndVisible()
        
        UINavigationBar.appearance().backgroundColor = .white
//        let navigationBarAppearace = UINavigationBar.appearance()
//        navigationBarAppearace.tintColor = UIColor(red: 101/255, green: 191/255, blue: 255/255, alpha: 1)
        
        return true
    }

}

