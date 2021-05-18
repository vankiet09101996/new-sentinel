//
//  MenuViewController.swift
//  new sentinal
//
//  Created by NEM on 26/04/2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        registerTableViewCell()
        
    }
    
    
    func registerTableViewCell() {
//        tableView.register(UINib(nibName: "MySiteTableViewCell", bundle: nil), forCellReuseIdentifier: "MySiteTableViewCell")
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
}

extension MenuViewController : UITableViewDelegate {}

extension MenuViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MySiteTableViewCell", for: indexPath) as! MySiteTableViewCell
        return cell
    }
    
    
}
