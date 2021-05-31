//
//  MySiteTableViewCell.swift
//  new sentinal
//
//  Created by NEM on 07/05/2021.
//

import UIKit

class MainSiteTbViewCell: UITableViewCell {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dayTimeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var NumberCountLabel: UILabel!
    
    
//    var updateNameCallBack: ((_ data: SiteObj) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
