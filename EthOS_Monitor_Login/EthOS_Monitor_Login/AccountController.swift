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
        
        let account = Account(nickName: nickName, ethOSaddress: ethOSaddress, URL: createURL(ethOSaddress: ethOSaddress))
        self.accounts.append(account)
        NotificationCenter.default.post(name: .refreshTableView, object: nil)
    }
    
    func createURL(ethOSaddress: String) -> URL {
        
        let baseURL = URL(string: "http://\(ethOSaddress).ethosdistro.com/")
        guard let url = baseURL else { NSLog("baseURL was nil"); return URL(string: "http://3df0c9.ethosdistro.com/")! }
        
        return url
    }
    
    //MARK: - Fetch / GET Method
    
    
    
}
