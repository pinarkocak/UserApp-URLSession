//
//  TableViewCell.swift
//  UserApp_URLSession
//
//  Created by Pınar Koçak on 25.04.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var personInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

