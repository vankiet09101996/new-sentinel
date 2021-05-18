//
//  MHCViewController.swift
//  new sentinal
//
//  Created by NEM on 04/05/2021.
//

import UIKit

class MHCViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initView2Controller()
        // Do any additional setup after loading the view.
    }
    

    func initView2Controller() {
        if let mainSite2 = self.mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            self.setViewControllers([mainSite2], animated: true)
        }
}
}
