//
//  suKienViewController.swift
//  new sentinal
//
//  Created by NEM on 28/04/2021.
//

import UIKit

class suKienViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myTable: UITableView!
    var siteObj: SiteObj?
    var mang:[SiteObj] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.rowHeight = 83
        nameLabel.text = siteObj?.siteName
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mang.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! DONGTableViewCell
        cell.imgHinh.image = UIImage(named: "images (-1.png")
        cell.myLabel1.text = mang[indexPath.row].siteName
        cell.myLabel2.text = "Updated: SAT, JUN 15 7:30 PM"
        cell.myLabel3.text = "COUNT"
        cell.myLabel4.text = "1,493"
        return cell
    }

}
