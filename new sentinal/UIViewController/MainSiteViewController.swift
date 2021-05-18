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
    
    
    private var siteObj = SiteObj()
    
    var sites:[SiteObj] = []
    var selectedItem: SiteObj?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var containerView: UIView!
    
    let menuVC = MenuViewController()
    var isShowDrawer:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuVC.view.backgroundColor = .white
        let size = UIScreen.main.bounds.size
        menuVC.view.frame = CGRect(x: -size.width, y: 0, width: size.width, height: self.view.bounds.height)
        UIApplication.shared.keyWindow!.addSubview(menuVC.view)
        
        self.tableView.rowHeight = 83.0     
        registerTableViewCell()
        
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
        tableView.register(UINib(nibName: "MySiteTableViewCell", bundle: nil), forCellReuseIdentifier: "MySiteTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = sites[indexPath.item]
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? suKienViewController {
            controller.siteObj = selectedItem
            controller.mang = sites
        }
    }
    
    
    
    
    
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sites.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! MySiteTableViewCell
        cell.myImage.image = UIImage(named: "images (-1.png")
        cell.nameLabel.text = sites[indexPath.row].siteName
        cell.NumberCountLabel.text = "1,493"
        cell.dayTimeLabel.text = "Updated: SAT, JUN 15 7:30 PM"
        return cell
    }
    
    

    
    @IBAction func onAddSite(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let manhinh2 = sb.instantiateViewController(identifier: "addNewSiteViewController") as! addNewSiteViewController
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

