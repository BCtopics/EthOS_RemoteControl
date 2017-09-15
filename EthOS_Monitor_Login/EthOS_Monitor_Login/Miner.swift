//
//  Miners.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class Miner {
    
    //MARK: - Properties
    
    let totalHashrate: String
    let ipaddress: String
    let rigName: String

    //MARK: - Initilizers
    
    init?(dictionary: [String: Any]) {
        
        guard let totalHashrate = dictionary[Keys.kHash] as? String else { NSLog("Total Hashrate is Nil"); return nil }
        guard let rigName = "Name of rig" as? String else { NSLog("rigname is Nil"); return nil }
        guard let ipaddress = dictionary[Keys.kIP] as? String else { NSLog("ip is Nil"); return nil }
        
        self.totalHashrate = totalHashrate
        self.rigName = rigName
        self.ipaddress = ipaddress
    }
    
}
