//
//  SetupBarnsViewController.swift
//  new sentinal
//
//  Created by NEM on 05/05/2021.
//

import UIKit

class SetupBarnsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView2: UITableView!
    
    var barname:[String] = ["Barn 1 Name", "Barn 2 Name", "Barn 3 Name", "Barn 4 Name", "Barn 5 Name", "Barn 6 Name", "Barn 7 Name", "Barn 8 Name", "Barn 9 Name", "Barn 10 Name", "Barn 11 Name", "Barn 12 Name", "Barn 13 Name", "Barn 14 Name", "Barn 15 Name"]
    var mang:[String] = ["Barn 1", "Barn 2", "Barn 3", "Barn 4", "Barn 5", "Barn 6", "Barn 7", "Barn 8", "Barn 9", "Barn 10", "Barn 11", "Barn 12", "Barn 13", "Barn 14", "Barn 15"]
    
    var siteObj: SiteObj?
    var onAddNewSte: ((_ data: SiteObj) -> Void)?
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myTableView2.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberBarns = self.siteObj?.numberBarn else {
            return 0
        }
        return numberBarns
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SetupBarnsTableViewCell
        cell.barnName.text = barname[indexPath.row]
        cell.number.text = "Number of Pens"
        cell.barnNameTextField.text = ""
        cell.numberTextField.text = ""
        cell.barnNameTextField.placeholder = mang[indexPath.row]
        return cell
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView2.dataSource = self
        myTableView2.delegate = self
        myTableView2.rowHeight = 76
        

        }
    
    
    @IBAction func onDone(_ sender: Any) {
        if let siteObj = siteObj {
            self.onAddNewSte?(siteObj)
            navigationController?.popToRootViewController(animated: true)
        }
    }

}

