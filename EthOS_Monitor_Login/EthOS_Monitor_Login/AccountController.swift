//
//  AccountController.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class AccountController {
    
    //MARK: - Properties
    
    static let shared = AccountController()
    
    var accounts: [Account] = []
    
    //MARK: - Creator Methods
    
    func createAccount(nickName: String, ethOSaddress: String) {
        
        let account = Account(nickName: nickName, ethOSaddress: ethOSaddress, accountURL: createURL(ethOSaddress: ethOSaddress))
        self.accounts.append(account)
        NotificationCenter.default.post(name: .refreshTableView, object: nil)
    }
    
    func createURL(ethOSaddress: String) -> URL {
        
        let baseURL = URL(string: "http://\(ethOSaddress).ethosdistro.com/")
        guard let url = baseURL else { NSLog("baseURL was nil"); return URL(string: "http://3df0c9.ethosdistro.com/")! }
        
        return url
    }
    
    //MARK: - Fetch / GET Method
    
    static func fetchMinersFromAccount(account: Account, completion: @escaping (AccountInfo) -> Void) {
        
        let urlParamaters = [
            "json" : "yes"
        ]
        
        // Perform Request
        
        NetworkController.performRequest(for: account.accountURL!, httpMethod: .get, urlParameters: urlParamaters, body: nil) { (data, error) in //FIXME: - Fix Unwrapp
            
            // Error Handle
            if let error = error {
                NSLog("Error performing fetch request. \(error.localizedDescription)")
                return
            }
            
            // Make sure data is there
            guard let data = data else { NSLog("Data was invalid"); return }
            
            //Serialize the json from the bits we get back
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else { NSLog("Error during JSONSerialization"); return }
            
            // Create miner objects
            
            guard let accountInfo = AccountInfo(dictionary: jsonDictionary) else {  NSLog("AccountInfo Error in MinerController"); return }
            
            guard let minerDictionary = jsonDictionary["rigs"] as? [String : Any] else {
                NSLog("Miner Dictionary failed")
                return
            }

            MinerController.shared.createMiners(dictionary: minerDictionary)
            
            completion(accountInfo)
        }
        
    }
    
}
