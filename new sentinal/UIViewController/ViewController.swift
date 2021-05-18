//
//  ViewController.swift
//  new sentinal
//
//  Created by NEM on 25/04/2021.
//

import UIKit
import Foundation
var chuoi:String = ""

class ViewController: UIViewController {
    //    var Email = String() , Password = String()
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        



        viewBottom.layer.cornerRadius = 22
        signIn.layer.cornerRadius = 5
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func ButtonSignIn(_ sender: Any) {
        
        chuoi = email.text!
        //        Password = password.text!
        //        if Email == "phanh@gmail.com" && Password == "123456" {
        //            let AMG = storyboard?.instantiateViewController(withIdentifier: "S2") as! NEWViewController
        //
        //            present(AMG, animated: true, completion: nil) }
        //        }
//        guard let email = email.text, email.count > 0 else {
//            self.showAlert(title: "Lỗi", message: "Vui lòng nhập email")
//            return
//        }
//        guard let password = password.text, password.count > 0 else {
//            self.showAlert(title: "Lỗi", message: "Vui lòng nhập password")
//            return
//        }
//        if !email.isValidEmail() {
//            self.showAlert(title: "Lỗi", message: "Vui lòng nhập email đúng định dạng")
//            return
//        }
//        if !password.isValidPassword() {
//            self.showAlert(title: "lỗi", message: "vui lòng nhập đúng pass word")
//            return
//        }
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


















