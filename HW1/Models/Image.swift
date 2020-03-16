//
//  Song.swift
//  HW1
//
//  Created by Vitaliy Vorobyov on 15.03.2020.
//  Copyright © 2020 Vitaliy Vorobyov. All rights reserved.
//

import Foundation

class Image {
    let description: String
    let index: Int
    let downloadURL: String
    
    var downloaded = false
    
    init(description: String, downloadURL: String, index: Int) {
        self.description = description
        self.index = index
        self.downloadURL = downloadURL
    }
}
