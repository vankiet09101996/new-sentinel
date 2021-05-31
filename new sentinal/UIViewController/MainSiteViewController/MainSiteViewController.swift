//
//  MainSiteViewController.swift
//  new sentinal
//
//  Created by NEM on 27/04/2021.
//

import UIKit

protocol MainSiteViewControllerDelegate: class {
    func mainSiteViewControllerDidTapMenuButton(_ rootViewController: MainSiteViewController)
}
class MainSiteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: variables
    private var siteObj = SiteObj()
    var sites:[SiteObj] = []
    var selectedItem: SiteObj?
    let menuVC = MenuViewController()
    var isShowDrawer:Bool = false
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var containerView: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuVC.view.backgroundColor = .white
        let size = UIScreen.main.bounds.size
        menuVC.view.frame = CGRect(x: -size.width, y: 0, width: size.width, height: self.view.bounds.height)
        UIApplication.shared.keyWindow!.addSubview(menuVC.view)
        
        self.tableView.rowHeight = 84.0     
        registerTableViewCell()
        
        //MARK: Tap Gesture
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender: )))
        rightSwipe.direction = .right
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe2(sender: )))
//        leftSwipe.direction = .left
        view.addGestureRecognizer(rightSwipe)
//        view.addGestureRecognizer(leftSwipe)
        }
    
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        let size = UIScreen.main.bounds.size
        UIView.animate(withDuration: 0.4, animations: {[weak self] in
            guard let self = self else { return }
            self.isShowDrawer = true
            self.menuVC.view.frame = CGRect(x: 0, y: 0, width: size.width, height: self.view.bounds.height)
        })

    }
//    @objc func handleSwipe2(sender: UISwipeGestureRecognizer){
//        let size = UIScreen.main.bounds.size
//        UIView.animate(withDuration: 0.4, animations: {[weak self] in
//            guard let self = self else { return }
//            self.isShowDrawer = false
//            self.menuVC.view.frame = CGRect(x: -size.width, y: 0, width: size.width, height: self.view.bounds.height)
//        })
//    }

    
    
    
    func registerTableViewCell() {
        tableView.register(UINib(nibName: "MainSiteTbViewCell", bundle: nil), forCellReuseIdentifier: "MainSiteTbViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //MARK: Select Row -> Detail
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedItem = sites[indexPath.item]
            self.tableView.allowsMultipleSelection = false //MARK: thêm test
            self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DetailViewController {
            controller.siteObj = selectedItem
            
            //MARK: kiểm tra phần tử có nằm trong mảng chưa, nếu có thì xoá
            if let deleleItem = sites.firstIndex(where: { $0.siteName == controller.siteObj?.siteName }) {
                sites.remove(at: deleleItem)
            }   
            controller.deleteSite = { [self] siteObj in
                controller.siteObj = self.siteObj
                controller.myTable.reloadData()
            }
            controller.updateSites = { siteObj in
                self.siteObj = siteObj!
                self.sites.append(siteObj!)
                self.tableView.reloadData()
            }
            
        }
    }
    
    
    //MARK: Drawer menu
    @IBAction func onMenuShow(_ sender: Any)  {
        let size = UIScreen.main.bounds.size
        if !isShowDrawer  {
            UIView.animate(withDuration: 0.4, animations: {[weak self] in
                guard let self = self else { return }
                self.isShowDrawer = true
                self.menuVC.view.frame = CGRect(x: 0, y: 0, width: size.width, height: self.view.bounds.height)
            })
        } else {
            UIView.animate(withDuration: 0.4, animations: {[weak self] in
                guard let self = self else { return }
                self.isShowDrawer = false
                self.menuVC.view.frame = CGRect(x: -size.width, y: 0, width: size.width, height: self.view.bounds.height)
            })
        }
    }
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! MainSiteTbViewCell
        cell.myImage.image = UIImage(named: "ic_add.png")
        cell.nameLabel.text = sites[indexPath.row].siteName
        cell.dayTimeLabel.text = sites[indexPath.row].updateDateDisplay
        var countPen = 0
        sites[indexPath.row].barns?.forEach { barnObj in
            countPen += barnObj.numberOfPen ?? 0
        }
        cell.NumberCountLabel.text = String(describing: countPen)
        selectedItem = sites[indexPath.item]
        return cell
    }


    //MARK: Add Sites -> AddNewVC
    @IBAction func onAddSite(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let manhinh2 = sb.instantiateViewController(identifier: "AddNewSiteViewController") as! AddNewSiteViewController
        manhinh2.onAddNewSte = {  [weak self] siteObj in
            guard let self = self else {
                return
            }
            self.sites.append(siteObj)
            self.tableView.reloadData()
        }
        self.navigationController?.pushViewController(manhinh2, animated: true)
    }
    
    
}

