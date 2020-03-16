//
//  DownloadManager.swift
//  HW1
//
//  Created by Vitaliy Vorobyov on 15.03.2020.
//  Copyright © 2020 Vitaliy Vorobyov. All rights reserved.
//

import Foundation

class DownloadManager {
    let defaultSession = URLSession(configuration: .default)
    let apiKey = "zl4jUXQCnyYysQ6_lLTmUEOT9J41tS6pQK6SCfqoN50"
    
    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    var images: [Image] = []
    
    typealias JSONImageItem = [String: Any]
    typealias JSONImageArray = [Any]
    
    func getRandomImages(amount: Int) {
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: "https://api.unsplash.com/photos/random") {
            urlComponents.query = "client_id=\(apiKey)&count=30"
            
            guard let url = urlComponents.url else {
                print("Error creating url")
                return
            }
            
            dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
                defer {
                    self?.dataTask = nil
                }
              
                if let error = error {
                    print("DataTask error: " + error.localizedDescription + "\n")
                } else if
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    self?.processData(data)
                } else {
                    let response = response as? HTTPURLResponse
                    print(response?.statusCode)
                }
            }
            dataTask?.resume()
        }
    }
    
    func processData(_ data: Data) {
        images.removeAll()
        
        var result: JSONImageArray?
        
        do {
          result = try JSONSerialization.jsonObject(with: data, options: []) as? JSONImageArray
        } catch let parseError as NSError {
          print("JSONSerialization error: \(parseError.localizedDescription)\n")
          return
        }
        
        var index = 0
        
        for imageItem in result! {
            if let imageItem = imageItem as? JSONImageItem {
                if let description = imageItem["description"] as? String,
                let urls = imageItem["urls"] as? Dictionary<String, Any>,
                let downloadURL = urls["full"] as? String {
                    images.append(Image(description: description, downloadURL: downloadURL, index: index))
                    index += 1
                } else {
                    if let urls = imageItem["urls"] as? Dictionary<String, Any>,
                        let downloadURL = urls["full"] as? String {
                        images.append(Image(description: "No Description", downloadURL: downloadURL, index: index))
                            index += 1
                    }
                }
            } else {
                continue
            }
        }
    }
}
