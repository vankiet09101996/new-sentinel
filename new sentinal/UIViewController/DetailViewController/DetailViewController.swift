//
//  DetailViewController.swift
//  new sentinal
//
//  Created by NEM on 28/04/2021.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: CallBack
    var onAddNewSte: ((_ data: SiteObj) -> Void)?
    var deleteSite: ((_ data: SiteObj?) -> Void)?
    var updateSites: ((_ data: SiteObj?) -> Void)?
    //MARK: IBOutLet
    @IBOutlet var citiesButton: [UIButton]!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberCountLabel: UILabel!
    @IBOutlet weak var myTable: UITableView!
    
    //MARK: Variables
    var siteObj: SiteObj?
    var selectedItemS: BarnObj?
    var indexForCell = Int()
    var barnObj: BarnObj?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        myTable.rowHeight = 83
        nameLabel.text = siteObj?.siteName
        dateLabel.text = siteObj?.updateDateDisplay
        var couPen = 0
        siteObj?.barns?.forEach { barnObj in
            couPen += barnObj.numberOfPen ?? 0
        }
        numberCountLabel.text = String(describing: couPen)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
//        manhinh2.infoEdinavigationController?.navigationBar.tintColor = UIColor.white
    }
    //MARK: tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberBarns = self.siteObj?.numberBarn else {
            return 1
        }
        return numberBarns
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell") as! DetailTableViewCell
        guard let siteObj = self.siteObj, let barns = siteObj.barns else {
            return UITableViewCell()
        }
        cell.imgHinh.image = UIImage(named: "ic_add.png")
        cell.nameLabel.text = barns[indexPath.row].barnName
        cell.dayTimeLabel.text = siteObj.updateDateDisplay
        cell.numberCountLabel.text = String(barns[indexPath.row].numberOfPen!)
        
        return cell
    }
    //MARK: Edit 1 CELL -> SetupBarns
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItemS = siteObj?.barns![indexPath.item]
        self.performSegue(withIdentifier: "showEditCellDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let editBarnVC = segue.destination as? SetupBarnsViewController {
                editBarnVC.barnObj = selectedItemS
                editBarnVC.enumSetupBarn = .EditBarn
                
//                editBarnVC.barnObj = barnObj //MARK: mới
                editBarnVC.updateBarn = { barnObj in
                    self.barnObj = barnObj
                    self.myTable.reloadData()
                }
            }
        }
    
    
    
    //MARK: Drop down
    @IBAction func onDrop(_ sender: Any) {
        citiesButton.forEach { (Button) in
            UIView.animate(withDuration: 0.3, animations: {
                Button.isHidden = !Button.isHidden
            })
        }
    }
    //MARK: Edit ALL CELL -> SetupBarns
    @IBAction func onEdit(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let SetupBarnsVC = sb.instantiateViewController(identifier: "SetupBarnsViewController") as! SetupBarnsViewController
        
        SetupBarnsVC.enumSetupBarn = .EditeSite
        SetupBarnsVC.siteObj = siteObj
        SetupBarnsVC.updateSite = { siteObj in
            self.siteObj = siteObj
            self.myTable.reloadData()
        }
        self.navigationController?.pushViewController(SetupBarnsVC, animated: true)
    }
        
    //MARK: Delete Site -> MainVC
    @IBAction func onDelete(_ sender: UIButton) {
        let MainVC = self.navigationController?.viewControllers[0] as? MainSiteViewController
        self.deleteSite?(siteObj)
        MainVC?.tableView.reloadData()
        self.navigationController?.popToViewController(MainVC!, animated: true)
    }
    @IBAction func onBackMain(_ sender: Any) {
        if let siteObj = siteObj {
            self.updateSites?(siteObj)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}

//MARK: thêm phần edit barnObj, truyền mỗi 1 BarnObj từ cell bên này qua màn setupBarn, từ màn setupBarn tạo 1 biến var barnObj : BarnObj?, lấy giữ liệu bắn qua thằng setUpBarn rồi done quay ngược lại thằng detail lưu lại.






//        let hitPoint = sender.convert(CGPoint.zero , to: myTable)
//        if let indexPath = myTable.indexPathForRow(at: hitPoint) {
//            var sitesObjs = siteObj?.numberBarn
//            siteObj?.numberBarn.
//        }
        
