//
//  Song.swift
//  HW1
//
//  Created by Vitaliy Vorobyov on 15.03.2020.
//  Copyright © 2020 Vitaliy Vorobyov. All rights reserved.
//

import Foundation

class Image {
    let name: String
    let index: Int
    let previewURL: URL
    let downloadURL: URL
    
    var downloaded = false
    
    init(name: String, index: Int, previewURL: URL, downloadURL: URL) {
        self.name = name
        self.index = index
        self.previewURL = previewURL
        self.downloadURL = downloadURL
    }
}
