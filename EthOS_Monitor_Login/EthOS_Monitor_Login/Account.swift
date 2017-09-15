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
    
    //MARK: - Initiailizers
    
    init(nickName: String, ethOSaddress: String) {
        
        self.nickName = nickName
        self.ethOSaddress = ethOSaddress
    }
    
}
