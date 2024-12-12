//
//  CountryTableViewCell.swift
//  CountryApp
//
//  Created by Anusha Raju on 12/12/24.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var region: UILabel!
    
    @IBOutlet weak var flagImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
