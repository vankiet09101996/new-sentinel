//
//  DONGTableViewCell.swift
//  new sentinal
//
//  Created by NEM on 28/04/2021.
//

import UIKit

class DONGTableViewCell: UITableViewCell {
    @IBOutlet weak var imgHinh: UIImageView!
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var myLabel4: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
