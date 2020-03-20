//
//  ToDoViewController.swift
//  HW1
//
//  Created by Vitaliy Vorobyov on 20.03.2020.
//  Copyright © 2020 Vitaliy Vorobyov. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    @IBOutlet var tableViewToDo: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DownloadManager.shared.getRandomImages(amount: 30) { results in
            self.tableViewToDo.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DownloadManager.shared.images.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)

        let image = DownloadManager.shared.images[indexPath.row]
        cell.textLabel?.text = image.description

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
}
