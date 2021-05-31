//
//  addNewSiteViewController.swift
//  new sentinal
//
//  Created by NEM on 05/05/2021.
//

import UIKit
class SiteObj {
    var id:Int?
    var siteName: String?
    var siteAddress: String?
    var numberBarn: Int?
    var updatedDate: String?
    var barns:[BarnObj]?
    
    init() { }
    
    var updateDateDisplay: String? {
        get {
            guard let updatedDate = self.updatedDate else {
                return ""
            }
            return "Updated : \(updatedDate)"
        }
    }
}

class BarnObj {
    var id: Int?
    var barnName: String?
    var numberOfPen: Int?
    
}



//var barn = UITextField()

//cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
//cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
//cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
//cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
//cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
class AddNewSiteViewController: UIViewController {
//    var INT:Int = Int()
    @IBOutlet weak var siteNameTextField: UITextField!
    
    @IBOutlet weak var siteAddressTextField: UITextField!
    
    @IBOutlet weak var barnTextField: UITextField!
    
    var onAddNewSte: ((_ data: SiteObj) -> Void)?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.black
        }
    
        
    
    @IBAction func onNext(_ sender: Any) {
        guard let sitename = siteNameTextField.text, sitename.count > 0 else {
            self.showAlert(title: "Lỗi", message: "Vui Lòng Nhập Site Name")
            return
        }
        guard let siteaddress = siteAddressTextField.text, siteaddress.count > 0 else {
            self.showAlert(title: "Lỗi", message: "Vui Lòng Nhập Site Address")
            return
        }
        guard let barn = barnTextField.text, barn.count > 0 else {
            self.showAlert(title: "Lỗi", message: "Vui Lòng Nhập Barn")
            return
        }
        
        
        let siteObj = SiteObj()
        siteObj.siteName = sitename
        siteObj.siteAddress = siteaddress
        siteObj.numberBarn = Int(barn)
        
        let updatedDate =  Date()
        siteObj.updatedDate = updatedDate.convertToString()
        
        
        let manhinh3 = self.navigationController?.mainStoryBoard.instantiateViewController(identifier: "SetupBarnsViewController") as! SetupBarnsViewController
        manhinh3.siteObj = siteObj
        manhinh3.onAddNewSte = self.onAddNewSte
        self.navigationController?.pushViewController(manhinh3, animated: true)
    }
}

