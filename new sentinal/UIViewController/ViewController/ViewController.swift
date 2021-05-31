//
//  ViewController.swift
//  new sentinal
//
//  Created by NEM on 25/04/2021.
//

import UIKit
import Foundation
var emailShowDrawer:String = ""

class ViewController: UIViewController {
    //    var Email = String() , Password = String()
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        



        viewBottom.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 5
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        emailShowDrawer = emailTextField.text!
        guard let email = emailTextField.text, email.count > 0 else {
            self.showAlert(title: "Lỗi", message: "Vui lòng nhập email")
            return
        }
        guard let password = passwordTextField.text, password.count > 0 else {
            self.showAlert(title: "Lỗi", message: "Vui lòng nhập password")
            return
        }
        if !email.isValidEmail() {
            self.showAlert(title: "Lỗi", message: "Vui lòng nhập email đúng định dạng")
            return
        }
        if !password.isValidPassword() {
            self.showAlert(title: "lỗi", message: "vui lòng nhập đúng pass word")
            return
        }
//        if email.isValidEmail() && password.isValidPassword() == true {
            //            let AMG = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            //                       present(AMG, animated: true, completion: nil)
            //return
  //      }
        initView()
    }
    
    func initView() {
        let vic = MySitesViewController()
        self.view.window?.rootViewController = vic
        self.view.window?.makeKeyAndVisible()
    }
}


















