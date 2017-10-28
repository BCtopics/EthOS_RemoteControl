//
//  MinersMainViewController.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class MinersMainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchInfo()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionData), name: .refreshCollectionView, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        MinerController.shared.miners = []
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
                
                if Double(accountInfo.averageTemp)! > 70.0 && Double(accountInfo.averageTemp)! < 80.0 {
                    self.averageTemp.textColor = .orange
                } else if Double(accountInfo.averageTemp)! >= 80.0 {
                    self.averageTemp.textColor = .red
                } else if Double(accountInfo.averageTemp)! <= 70.0 {
                    self.averageTemp.textColor = .green
                }
                
                // Miner Info
                
                // SetUp Table View With Miners Here
                
            }
        }
    }
    
    @objc func reloadCollectionData() {
        DispatchQueue.main.async {
            
            self.minersCollectionView.reloadData()
        }
    }
    
    // MARK: - Navigation
    
    
    // MARK: UICollectionViewDataSource
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MinerController.shared.miners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "minerCell", for: indexPath) as? MinerCollectionViewCell else { return UICollectionViewCell() }
        
        let miner = MinerController.shared.miners[indexPath.row]
        
        cell.rigName.text = miner.rigName
        cell.totalHashrate.text = miner.totalHashrate //FIXME: - Make this actually total hashrate
        cell.ipaddresslabel.text = miner.ipaddress

        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = collectionView.cellForItem(at: indexPath) as! MinerCollectionViewCell
        //FIXME: - What was I doing with this?
        //NOTES: - I believe this was to click on for more information?
    }
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var totalHashRate: UILabel!
    @IBOutlet weak var totalGPUSLabel: UILabel!
    @IBOutlet weak var totalRigsLabel: UILabel!
    @IBOutlet weak var averageTemp: UILabel!
    @IBOutlet weak var minersCollectionView: UICollectionView!
    
}
