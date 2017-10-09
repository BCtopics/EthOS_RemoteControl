//
//  AccountInfo.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class AccountInfo {
    
    //MARK: - Properties
    
    let aliveGPUS: String
    let totalGPUS: String
    let totalRigs: String
    let aliveRigs: String
    let totalHashrate: String
    let averageTemp: String
    
    //MARK: - Initilizers
    
    init?(dictionary: [String: Any]) {
        
        guard let aliveGPUS = dictionary[Keys.kAliveGPUS] as? Int else { NSLog("Alive GPUS Is NIL"); return nil }
        guard let totalGPUS = dictionary[Keys.kTotalGPUS] as? Int else { NSLog("Total GPUS Is NIL"); return nil }
        guard let aliveRigs = dictionary[Keys.kAliveRigs] as? Int else { NSLog("Alive Rigs Is NIL"); return nil }
        guard let totalRigs = dictionary[Keys.kTotalRigs] as? Int else { NSLog("Total Rigs Is NIL"); return nil }
        guard let totalHashrate = dictionary[Keys.kTotalHash] as? Double else { NSLog("Total Hashrate Is NIL"); return nil }
        guard let averageTemp = dictionary[Keys.kAvgTemp] as? Double else { NSLog("Average Temp Is NIL"); return nil }
        
        self.totalGPUS = String(totalGPUS)
        self.aliveGPUS = String(aliveGPUS)
        self.aliveRigs = String(aliveRigs)
        self.totalRigs = String(totalRigs)
        self.totalHashrate = String(totalHashrate)
        self.averageTemp = String(averageTemp)
    }
    
}
