//
//  ViewController.swift
//  KVO
//
//  Created by Dung on 7/23/17.
//  Copyright © 2017 Dung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    
    // MARK: -
    
    let configurationManager = ConfigurationManager(withConfiguration: Configuration())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt), options: [.old, .new, .initial], context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Actions
    
    @IBAction func updateConfiguration(sender: UIButton) {
        configurationManager.updateConfiguration()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(configurationManager.configuration.updatedAt) {
            // Update Time Label
            timeLabel.text = configurationManager.updatedAt
        }
    }
    deinit {
        removeObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt))
    }
}

