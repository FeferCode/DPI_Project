//
//  AppDelegate.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 10.02.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarViewController = BaseTabBarViewController()
        tabBarViewController.setViewControllers(setupTabBarViewControllers(), animated: true)

        let navigationController = BaseNavigationController(rootViewController: tabBarViewController)

        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {

        self.saveContext()
    }

    //MARK: - For Siri Action
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        print("======================================================================")
        print("\(userActivity.activityType)")
        print("======================================================================")

        if userActivity.activityType == "pl.fefercode.dpi.history" {
            print("==================================>activity<====================================")
            if let navigationVC = window!.rootViewController as? BaseNavigationController {
                print("==================================>navigation<====================================")
                if let tabBarVC = navigationVC.viewControllers[0] as? BaseTabBarViewController {
                    print("==================================>tabbar<====================================")
                    tabBarVC.selectedIndex = 1
                    return true
                }
            }
        }
        return false
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "DPICalculator")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
  
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

