//
//  navViewController.swift
//  new sentinal
//
//  Created by NEM on 06/05/2021.
//

import UIKit

class NavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
        // Do any additional setup after loading the view.
    }
    func initViewController() {
        if let mainSite = self.mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            self.setViewControllers([mainSite], animated: true)
        }
    }

  
}
