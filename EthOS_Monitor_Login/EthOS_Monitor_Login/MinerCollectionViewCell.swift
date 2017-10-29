//
//  MinerCollectionViewCell.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class MinerCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var rigName: UILabel!
    @IBOutlet weak var totalHashrate: UILabel!
    @IBOutlet weak var ipaddresslabel: UILabel!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var instancesLabel: UILabel!
    
    @IBAction func connectButtonTapped(_ sender: Any) {
        
        guard let ipAddress = ipaddresslabel.text else { NSLog("IPAddress Is Nil, MinerCollectionViewCell"); return }
        
        SessionController.shared.startConnection(ip: ipAddress)
    }
    
}
