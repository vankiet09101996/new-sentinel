//
//  MenuViewController.swift
//  new sentinal
//
//  Created by NEM on 29/04/2021.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()
        
        let size =  UIScreen.main.bounds.size
        let View1 = UIView(frame: CGRect(x: 0, y: 0, width:size.width, height: size.height))
        View1.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        self.view.addSubview(View1)
        
//        view1.addGesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)) )
        View1.isUserInteractionEnabled = true
        View1.addGestureRecognizer(tap)
        
        
        
        let View2 = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 812))
        View2.backgroundColor = UIColor.white
        self.view.addSubview(View2)
//        View1.addSubview(View2)
        
        
        
        
        var imageView : UIImageView
            imageView  = UIImageView(frame:CGRect(x: 70.5, y: 45, width: 121, height: 28));
            imageView.image = UIImage(named:"stn_logo.png")
            View2.addSubview(imageView)
        
        
        
        let versionlabel = UILabel(frame: CGRect(x: 93, y: 86, width: 80, height: 13))
            versionlabel.font = UIFont.systemFont(ofSize: 13)
            versionlabel.textAlignment = .center
            versionlabel.textColor = .gray
            versionlabel.text = "Version 0.0.3"
            View2.addSubview(versionlabel)
        
        let loginAddLabel = UILabel(frame: CGRect(x: 24, y: 133, width: 109, height: 17))
            loginAddLabel.font = UIFont.systemFont(ofSize: 17)
            loginAddLabel.textAlignment = .left
            loginAddLabel.textColor = .black
            loginAddLabel.text = "Logged in as"
            View2.addSubview(loginAddLabel)
        
        let emailLabel = UILabel(frame: CGRect(x: 24, y: 161, width: 227, height: 17))
            emailLabel.font = UIFont.systemFont(ofSize: 17)
            emailLabel.textAlignment = .left
            emailLabel.textColor = .black
            emailLabel.text = emailShowDrawer
            View2.addSubview(emailLabel)
        
        let signOutButton = UIButton(frame: CGRect(x: 24, y: 757, width: 74, height: 17))
            signOutButton.backgroundColor = .white
            signOutButton.setTitle("Sign Out", for: .normal)
            signOutButton.setTitleColor(.red, for: .normal)

            signOutButton.addTarget(self, action: #selector(onSignOut), for: .touchUpInside)
            View2.addSubview(signOutButton)
            
        
//        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender: )))
//        rightSwipe.direction = .right
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender: )))
        leftSwipe.direction = .left
//        View1.addGestureRecognizer(rightSwipe)
        View1.addGestureRecognizer(leftSwipe)
        
        
        
        
    }
    @objc func viewTapped(sender: UITapGestureRecognizer) {
        print("view has")
    }
    
    
    @objc func onSignOut(sender: UIButton!) {
        initView()
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        let size = UIScreen.main.bounds.size
        UIView.animate(withDuration: 0.4, animations: {[weak self] in
        guard let self = self else { return }
        self.view.frame = CGRect(x: 0, y: 0, width: -size.width, height: self.view.bounds.height)
    })
    }
    func initView() {
        let vic = NavViewController()
        self.view.window?.rootViewController = vic
        self.view.window?.makeKeyAndVisible()
    }
    
}
