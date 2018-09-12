//
//  WebViewController.swift
//  DesignCodeAppAutoLayout
//
//  Created by Lisa Steele on 9/12/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var WebView: WKWebView!
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func reload(_ sender: Any) {
        WebView.reload()
    }
    @IBAction func goBack(_ sender: Any) {
        WebView.goBack()
    }
    @IBAction func goForward(_ sender: Any) {
        WebView.goForward()
    }
    @IBAction func actionButtonTapped(_ sender: Any) {
        let activityItems = [urlString] as! Array<String>
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityController.excludedActivityTypes = [.postToFacebook]
        present(activityController, animated: true, completion: nil)
    }
    @IBAction func safariButtonTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: urlString)!)
    }
    
    
    
    var urlString: String!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        WebView.load(request)
        
        WebView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    deinit {
        WebView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            if WebView.estimatedProgress == 1.0 {
                navigationItem.title = WebView.title
            } else {
                navigationItem.title = "Loading ..."
            }
        }
    }
}
