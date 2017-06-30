//
//  WelcomeViewController.swift
//  Uther
//
//  Created by why on 8/8/15.
//  Copyright (c) 2015 callmewhy. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController,UIAlertViewDelegate {
    let transitionManager = WelcomeTransitionManager()

    @IBOutlet weak var laosijiBtu: UIButton!
    @IBOutlet weak var enterBtu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.setStatusBarHidden(false, with: .slide)
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        
        enterBtu.addTarget(self, action: #selector(pushMain), for: .touchUpInside)
        
        laosijiBtu.addTarget(self, action: #selector(pushSiji), for: .touchUpInside)
        
        if AppUnitl.sharedManager().ssmodel.appstatus.isShow && UserDefaults.standard.bool(forKey: "pinglun" ) {
            
            laosijiBtu.isHidden = false
        }else{
            laosijiBtu.isHidden = true
        }
        
    }
    
    func pushMain() {
        self.performSegue(withIdentifier: "show_main", sender: nil)
    }
    
    func pushSiji() {
//        self.navigationController?.pushViewController(HongViewController(), animated: true)
        
        self.present(HongViewController(), animated: false) { 
            
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toViewController = segue.destination
        toViewController.transitioningDelegate = self.transitionManager
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !UserDefaults.standard.bool(forKey: "pinglun" ) && AppUnitl.sharedManager().ssmodel.appstatus.isShow {
            let infoAlert = UIAlertView.init(title: AppUnitl.sharedManager().ssmodel.appstatus.alertTitle, message: AppUnitl.sharedManager().ssmodel.appstatus.alertText, delegate: self, cancelButtonTitle: "取消")
            infoAlert.addButton(withTitle: "去评价")
            infoAlert.show()
        }
    }
    
    public func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int){
        if buttonIndex == 1 {
            
            let str = "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1251252305&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"
            
            UIApplication.shared.openURL(URL.init(string: str)!)
            
            UserDefaults.standard.set(true, forKey: "pinglun")
            
        }
    }
}
