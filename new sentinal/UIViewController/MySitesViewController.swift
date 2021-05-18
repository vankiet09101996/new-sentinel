//
//  MySitesViewController.swift
//  new sentinal
//
//  Created by NEM on 26/04/2021.
//

import UIKit

class MySitesViewController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewController()
        // Do any additional setup after loading the view.
    }
    func initViewController() {
        if let mainSite = self.mainStoryBoard.instantiateViewController(withIdentifier: "MainSiteViewController") as? MainSiteViewController {
            self.setViewControllers([mainSite], animated: true)
        }
    }

}
