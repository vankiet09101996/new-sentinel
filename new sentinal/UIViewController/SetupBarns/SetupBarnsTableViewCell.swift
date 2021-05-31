//
//  SetupBarnsTableViewCell.swift
//  new sentinal
//
//  Created by NEM on 05/05/2021.
//

import UIKit

class SetupBarnsTableViewCell: UITableViewCell {
//    var updateNameCallBack: ((_ data: SiteObj) -> Void)?
    @IBOutlet weak var barnNameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var barnNameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
   
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
