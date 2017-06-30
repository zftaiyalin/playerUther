//
//  AppDelegate.swift
//  Uther
//
//  Created by why on 7/29/15.
//  Copyright (c) 2015 callmewhy. All rights reserved.
//

import UIKit
import Keys


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UMAnalyticsConfig.sharedInstance().appKey = "59526c8cc62dca2b70000a61"
        UMAnalyticsConfig.sharedInstance().channelId = "App Store"
        MobClick.start(withConfigure: UMAnalyticsConfig.sharedInstance())
        
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        let currentDateString = dateFormatter.string(from: Date.init())
        let ss = "http://opmams01o.bkt.clouddn.com/stickhero.json?v=" + currentDateString
        let xcfURL = URL.init(string: ss)
        
        var content:String!
        do {
            content = try String(contentsOf:xcfURL!)
        }
        catch let error {
            // Error handling
            print(error)
        }
        if content != nil {
            let model = AppModel.yy_model(withJSON: content)
            model?.appstatus.isShow = true
            AppUnitl.sharedManager().ssmodel = model
            
        }
        
        
        let keys = UtherKeys()
        Bugly.start(withAppId: keys.kEY)
        DB.setupDatabase()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }


}

