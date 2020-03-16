//
//  ViewController.swift
//  HW1
//
//  Created by Vitaliy Vorobyov on 14.03.2020.
//  Copyright © 2020 Vitaliy Vorobyov. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    let downloadManager = DownloadManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Hello")
        
        downloadManager.getRandomImages(amount: 5)
    }
}

