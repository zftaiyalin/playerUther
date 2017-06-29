//
//  WelcomeViewController.swift
//  Uther
//
//  Created by why on 8/8/15.
//  Copyright (c) 2015 callmewhy. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    let transitionManager = WelcomeTransitionManager()

    @IBOutlet weak var laosijiBtu: UIButton!
    @IBOutlet weak var enterBtu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.setStatusBarHidden(false, with: .slide)
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        
        enterBtu.addTarget(self, action: #selector(pushMain), for: .touchUpInside)
        
        laosijiBtu.addTarget(self, action: #selector(pushSiji), for: .touchUpInside)
    }
    
    func pushMain() {
        self.performSegue(withIdentifier: "show_main", sender: nil)
    }
    
    func pushSiji() {
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toViewController = segue.destination
        toViewController.transitioningDelegate = self.transitionManager
    }
}
