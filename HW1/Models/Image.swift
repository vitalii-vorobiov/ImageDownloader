//
//  Song.swift
//  HW1
//
//  Created by Vitaliy Vorobyov on 15.03.2020.
//  Copyright © 2020 Vitaliy Vorobyov. All rights reserved.
//

import Foundation
import UIKit

class Image {
    let description: String
    let index: Int
    let downloadURL: URL
    let previewURL: URL
    
    var downloaded = false
    var previewImage: UIImage
    
    init(description: String, previewURL: URL, downloadURL: URL, index: Int) {
        self.description = description
        self.index = index
        self.previewURL = previewURL
        self.downloadURL = downloadURL
        self.previewImage = UIImage()
        
        self.downloadPreviewImage(from: previewURL)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadPreviewImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() {
                self.previewImage = UIImage(data: data)!
            }
        }
    }
    
//    func downloadFullImage(from url: URL) {
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
//            DispatchQueue.main.async() {
//                self.images[index] UIImage(data: data)
//            }
//        }
//    }
}
