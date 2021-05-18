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
            imageView.image = UIImage(named:"sentinel-logo-300x70.png")
            View2.addSubview(imageView)
        
        
        
        let label = UILabel(frame: CGRect(x: 93, y: 86, width: 80, height: 13))
            label.font = UIFont.systemFont(ofSize: 13)
            label.textAlignment = .center
            label.textColor = .gray
            label.text = "Version 0.0.3"
            View2.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x: 24, y: 133, width: 109, height: 17))
            label2.font = UIFont.systemFont(ofSize: 17)
            label2.textAlignment = .left
            label2.textColor = .black
            label2.text = "Logged in as"
            View2.addSubview(label2)
        
        let label3 = UILabel(frame: CGRect(x: 24, y: 161, width: 227, height: 17))
            label3.font = UIFont.systemFont(ofSize: 17)
            label3.textAlignment = .left
            label3.textColor = .black
            label3.text = "thomas@prestagefarms.com"
            View2.addSubview(label3)
        
        let button = UIButton(frame: CGRect(x: 24, y: 757, width: 74, height: 17))
            button.backgroundColor = .white
            button.setTitle("Sign Out", for: .normal)
            button.setTitleColor(.red, for: .normal)

            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            View2.addSubview(button)
            
        
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
    
    
    @objc func buttonAction(sender: UIButton!) {
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
        let vic = navViewController()
        self.view.window?.rootViewController = vic
        self.view.window?.makeKeyAndVisible()
    }
    
}
