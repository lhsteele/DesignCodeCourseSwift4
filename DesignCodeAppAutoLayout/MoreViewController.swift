//
//  MoreViewController.swift
//  DesignCodeAppAutoLayout
//
//  Created by Lisa Steele on 9/12/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    @IBAction func safariButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "More to Web", sender: "https://designcode.io")
    }
    @IBAction func communityButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "More to Web", sender: "https://spectrum.chat/design-code")
    }
    @IBAction func twitterHandleTapped(_ sender: Any) {
        performSegue(withIdentifier: "More to Web", sender: "https://twitter.com/mengto")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "More to Web" {
            let toNav = segue.destination as! UINavigationController
            let toVC = toNav.viewControllers.first as! WebViewController
            toVC.urlString = sender as! String
        }
    }

}
