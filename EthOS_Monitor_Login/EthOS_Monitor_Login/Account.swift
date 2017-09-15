//
//  Account.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class Account {
    
    //MARK: - Properties
    
    let nickName: String
    let ethOSaddress: String
    let accountURL: URL
    
    //MARK: - Initiailizers
    
    init(nickName: String, ethOSaddress: String, URL: URL) {
        
        self.nickName = nickName
        self.ethOSaddress = ethOSaddress
        self.accountURL = URL
    }
}
