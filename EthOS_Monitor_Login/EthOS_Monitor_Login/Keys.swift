//
//  Keys.swift
//  EthOS_Monitor
//
//  Created by Bradley GIlmore on 8/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

enum Keys: String {
    
    //MARK: - Per Rig
    
    case kGPUS = "gpus"
    case kHash = "hash"
    case kBioses = "bioses"
    case kCondition = "condition"
    case kConnectedDisplays = "connected_displays"
    case kCore = "core"
    case kCPUTemp = "cpu_temp"
    case kDriver = "driver"
    case kSSDName = "drive_name"
    case kFanRPM = "fanrpm"
    case KFreeSpace = "freespace"
    case kIP = "ip"
    case kLANCHIP = "lan_chip"
    case kLoad = "load"
    case kMemory = "mem"
    case kMemeInfo = "meminfo"
    case kMinerProgram = "miner"
    case kMinerHash = "miner_hashes"
    case kMinerInstance = "miner_instance"
    case kMinerSecs = "miner_secs"
    case kMotherboardModel = "mobo"
    case kPool = "pool"
    case kPowerTune = "powertune"
    case kRackLocation = "rack_loc"
    case kRam = "ram"
    case kRxkbps = "rx_kbps"
    case kServerTime = "server_time"
    case kTemp = "temp"
    case kTxkbps = "tx_kbps"
    case kUptime = "uptime"
    case kVersion = "version"
    case kVramSize = "vramsize"
    case kWatts = "watts"
    
    //MARK: -  Per Account

    case kAliveGPUS = "alive_gpus"
    case kAliveRigs = "alive_rigs"
    case kAvgTemp = "avg_temp"
    case kCapacity = "capacity"
    case kCurrentVersion = "current_version"
    case kTotalGPUS = "total_gpus"
    case kTotalHash = "total_hash"
    case kTotalRigs = "total_rigs"

}
