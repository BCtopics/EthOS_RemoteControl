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
    
    var totalHashrate: String
    let ipaddress: String
    var rigName: String
    var minerInstance: String
    var GPUSAlive: String

    //MARK: - Initilizers
    
    init?(dictionary: [String: Any]) {
        
        guard let totalHashrate = dictionary[Keys.kMinerHash] as? String else { NSLog("Total Hashrate is Nil"); return nil }
        guard let rigName = "Name of rig" as? String else { NSLog("rigname is Nil"); return nil }
        guard let ipaddress = dictionary[Keys.kIP] as? String else { NSLog("ip is Nil"); return nil }
        guard let GPUSAlive = dictionary[Keys.kGPUS] as? String else { NSLog("GPUSAlive is nil"); return nil }
        if let minerInstance = dictionary[Keys.kMinerInstance] as? String {
            self.GPUSAlive = GPUSAlive
            self.minerInstance = minerInstance
            self.totalHashrate = totalHashrate
            self.rigName = rigName
            self.ipaddress = ipaddress
            self.totalHashrate = fullHash(hashes: totalHashrate)
        } else if let minerInstanceInt = dictionary[Keys.kMinerInstance] as? Int {
            self.GPUSAlive = GPUSAlive
            self.minerInstance = String(minerInstanceInt)
            self.totalHashrate = totalHashrate
            self.rigName = rigName
            self.ipaddress = ipaddress
            self.totalHashrate = fullHash(hashes: totalHashrate)
        } else {
            return nil
        }
    }
    
    //MARK: - Calculations
    
    func fullHash(hashes: String) -> String {
        var hashes2 = hashes
        var hashTotalString = ""
        var hashTotal = 0.0
        var hashArray: [Double] = []
        var hashString = ""
        var counter = 1
        
        for i in hashes2.characters {
            if i == " " {
                hashArray.append(Double(hashString)!)
                hashString = ""
                counter += 1
            } else if hashes2.characters.count == counter {
                hashArray.append(Double(hashString)!)
                hashString = ""
            } else {
                hashString += "\(i)"
                counter += 1
            }
        }
        
        hashTotal = hashArray.reduce(0, +)
        hashTotalString = String(hashTotal)
        print(hashTotalString)
        return hashTotalString
    }
    
}
