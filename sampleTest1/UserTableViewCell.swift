//
//  UserTableViewCell1.swift
//  sampleTest1
//
//  Created by Azadeh Rassadi on 6/20/17.
//  Copyright © 2017 Azadeh Rassadi. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            self.selectionStyle = .none
        self.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
