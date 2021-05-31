//
//  DONGTableViewCell.swift
//  new sentinal
//
//  Created by NEM on 28/04/2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var imgHinh: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dayTimeLabel: UILabel!
    @IBOutlet weak var numberCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
