//
//  MySitesTableViewController.swift
//  new sentinal
//
//  Created by NEM on 26/04/2021.
//

import UIKit
//struct mySiteItem {
//    var name: String
//    var time: String
//    var soluong : String
//    var image : String
//}

class MySitesTableViewController: UITableViewController {

    var sites: [String]!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomCell")

        sites = [ "ROBINSON SITE", "Updated: SAT, JUN 15 7:30 PM", "COUNT 1,493" ]
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? MySiteTableViewCell
        if let cell = cell {
            return cell
        }
        return UITableViewCell()
        
        
    }
}
