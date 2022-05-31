//
//  MenuCell.swift
//  mySideMenu
//
//  Created by Seet, Ting Yang Irvin (uif08816) on 31/5/22.
//

import UIKit

class MenuCell: UITableViewCell {
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
