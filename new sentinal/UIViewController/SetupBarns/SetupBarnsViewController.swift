//
//  SetupBarnsViewController.swift
//  new sentinal
//
//  Created by NEM on 05/05/2021.
//

import UIKit

//MARK: Enum
enum EnumSetupBarn {
    case New, EditeSite, EditBarn
}

class SetupBarnsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView2: UITableView!
    var barname:[String] = ["Barn 1 Name", "Barn 2 Name", "Barn 3 Name", "Barn 4 Name", "Barn 5 Name", "Barn 6 Name", "Barn 7 Name", "Barn 8 Name", "Barn 9 Name", "Barn 10 Name", "Barn 11 Name", "Barn 12 Name", "Barn 13 Name", "Barn 14 Name", "Barn 15 Name"]
    var barn:[String] = ["Barn 1", "Barn 2", "Barn 3", "Barn 4", "Barn 5", "Barn 6", "Barn 7", "Barn 8", "Barn 9", "Barn 10", "Barn 11", "Barn 12", "Barn 13", "Barn 14", "Barn 15"]
    
    //MARK: Callback
    var onAddNewSte: ((_ data: SiteObj) -> Void)?
    var updateSite: ((_ data: SiteObj?) -> Void)?
    var updateBarn: ((_ data: BarnObj?) -> Void)?
    //MARK: Variables
    var siteObj: SiteObj?
    var barnObj: BarnObj?
    var enumSetupBarn:EnumSetupBarn = EnumSetupBarn.New
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myTableView2.reloadData()
    }
    
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if enumSetupBarn == .EditBarn {
            return 1
        }
        guard let numberBarns = self.siteObj?.numberBarn else {
            return 0
        }
        return numberBarns
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch enumSetupBarn {
        case .EditBarn:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SetupBarnsTableViewCell
            guard let barnObj = self.barnObj else {
                return UITableViewCell()
            }
            cell.barnNameTextField.text = barnObj.barnName
            cell.numberTextField.text = String(barnObj.numberOfPen!)
            return cell
        case .EditeSite:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SetupBarnsTableViewCell
            guard let siteObj = self.siteObj, let barns = siteObj.barns else {
                return UITableViewCell()
            }
            cell.barnNameTextField.text = barns[indexPath.row].barnName
            cell.numberTextField.text = String(barns[indexPath.row].numberOfPen!)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SetupBarnsTableViewCell
            cell.barnNameLabel.text = barname[indexPath.row]
            cell.numberLabel.text = "Number of Pens"
            cell.barnNameTextField.text = ""
            cell.numberTextField.text = ""
            cell.barnNameTextField.placeholder = barn[indexPath.row]
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView2.dataSource = self
        myTableView2.delegate = self
        myTableView2.rowHeight = 76
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    
    
    func getBarns(siteObj:SiteObj) -> [BarnObj] {
        if let numberOfBarn = siteObj.numberBarn {
            siteObj.barns?.removeAll()
            let totalBarn = (numberOfBarn - 1)
            for row in 0...totalBarn {
                if let cell = myTableView2.cellForRow(at: IndexPath(item: row, section: 0)) as? SetupBarnsTableViewCell {
                    let barn = BarnObj()
                    if  siteObj.barns == nil {
                        siteObj.barns = [BarnObj]()
                    }
                    
                    if let numberText = cell.numberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),numberText.count > 0 {
                        barn.numberOfPen =  Int(numberText)
                    }
                    if let nameText = cell.barnNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),nameText.count > 0 {
                        barn.barnName = String(nameText)
                    }
                    guard let nameText = cell.barnNameTextField.text, nameText.count > 0 else {
                        self.showAlert(title: "lỗi", message: "vui lòng nhập name" )
                        return []
                    }
                    guard let numberText = cell.numberTextField.text, numberText.count > 0 else {
                        self.showAlert(title: "lỗi", message: "vui lòng nhập Number Of Pens")
                        return []
                    }
                    siteObj.barns?.append(barn)
                }
            }
            return siteObj.barns ?? []
        }
        return []
    }
    
    @IBAction func onDone(_ sender: Any)  {
        switch enumSetupBarn {
        case .EditBarn:
            if let barnObj = barnObj {
                siteObj?.barns?.removeAll()
                if let cell = myTableView2.cellForRow(at: IndexPath(row: 0, section: 0)) as? SetupBarnsTableViewCell {
                    if let numberText = cell.numberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), numberText.count > 0 {
                        barnObj.numberOfPen = Int(numberText)
                    }
                    if let nameText = cell.barnNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), nameText.count > 0 {
                        barnObj.barnName = String(nameText)
                    }
                    siteObj?.barns?.append(barnObj)
                }
                self.updateBarn?(barnObj)
            }
            navigationController?.popViewController(animated: true)
        case .EditeSite:
            if let siteObj = siteObj {
                if getBarns(siteObj: siteObj).count > 0 {
                    self.updateSite?(siteObj)
                }
            }
            navigationController?.popViewController(animated: true)
        default:
            if let siteObj = siteObj {
                if getBarns(siteObj: siteObj).count > 0 {
                    self.onAddNewSte?(siteObj)
                    navigationController?.popToRootViewController(animated: true)
                   }
            }
        }
    }
}





