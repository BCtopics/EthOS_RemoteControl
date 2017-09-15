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
    
    func createAccount(nickName: String, ethOSaddress: String) {
        
        let account = Account(nickName: nickName, ethOSaddress: ethOSaddress)
        self.accounts.append(account)
        NotificationCenter.default.post(name: .refreshTableView, object: nil)
    }
    
}
