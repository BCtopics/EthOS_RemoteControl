//
//  MinersMainViewController.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class MinersMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchInfo()
    }
    
    var account: Account?
    
    func fetchInfo() {
        guard let account = self.account else { NSLog("Account is nil"); return }
        AccountController.fetchMinersFromAccount(account: account) { (accountInfo) in
            DispatchQueue.main.async {
                
                // Account Info
                
                self.totalGPUSLabel.text = "GPU's: \(accountInfo.aliveGPUS)/\(accountInfo.totalGPUS)"
                self.totalRigsLabel.text = "Rig's: \(accountInfo.aliveRigs)/\(accountInfo.totalRigs)"
                self.totalHashRate.text = "Combined Hashrate: \(accountInfo.totalHashrate)MH"
                self.averageTemp.text = "Average Temperature: \(accountInfo.averageTemp)C"
                
                // Total GPUS Color
                
                if accountInfo.aliveGPUS == accountInfo.totalGPUS {
                    self.totalGPUSLabel.textColor = .green
                } else {
                    self.totalGPUSLabel.textColor = .red
                }
                
                // Total Rigs Color
                
                if accountInfo.totalRigs == accountInfo.aliveRigs {
                    self.totalRigsLabel.textColor = .green
                } else {
                    self.totalRigsLabel.textColor = .red
                }
                
                // Average Temp Color
                
                if Int(accountInfo.averageTemp)! > 70 && Int(accountInfo.averageTemp)! < 80 {
                    self.averageTemp.textColor = .orange
                } else if Int(accountInfo.averageTemp)! >= 80 {
                    self.averageTemp.textColor = .red
                } else if Int(accountInfo.averageTemp)! <= 70 {
                    self.averageTemp.textColor = .green
                }
                
                // Miner Info
                
                // SetUp Table View With Miners Here
                
            }
        }
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var totalHashRate: UILabel!
    @IBOutlet weak var totalGPUSLabel: UILabel!
    @IBOutlet weak var totalRigsLabel: UILabel!
    @IBOutlet weak var averageTemp: UILabel!
    
}
