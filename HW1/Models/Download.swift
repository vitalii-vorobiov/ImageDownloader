//
//  Download.swift
//  HW1
//
//  Created by Vitaliy Vorobyov on 15.03.2020.
//  Copyright © 2020 Vitaliy Vorobyov. All rights reserved.
//

import Foundation

class Download {
  var isDownloading = false
  var progress: Float = 0
  var resumeData: Data?
  var task: URLSessionDownloadTask?
  var image: Image
  
  init(image: Image) {
    self.image = image
  }
}
