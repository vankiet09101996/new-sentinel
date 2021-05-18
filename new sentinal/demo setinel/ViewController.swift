//
//  ViewController.swift
//  demo setinel
//
//  Created by NEM on 25/04/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signIn.layer.cornerRadius = 5
        viewBottom.layer.cornerRadius = 22
    }


}

