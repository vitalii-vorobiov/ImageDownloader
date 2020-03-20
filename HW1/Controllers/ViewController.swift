//
//  ViewController.swift
//  HW1
//
//  Created by Vitaliy Vorobyov on 14.03.2020.
//  Copyright © 2020 Vitaliy Vorobyov. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        
        DownloadManager.shared.getRandomImages(amount: 30) { results in
        
        }
    }
}

