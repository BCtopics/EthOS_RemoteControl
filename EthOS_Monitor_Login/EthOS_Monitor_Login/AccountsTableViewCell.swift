//
//  AccountsTableViewCell.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {

    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var accountNameLabel: UILabel!
    
}
