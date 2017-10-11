//
//  Account+Convenience.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 10/11/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation
import CoreData

extension Account {
    
    @discardableResult convenience init(nickName: String, ethOSaddress: String, accountURL: URL, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.nickName = nickName
        self.ethOSaddress = ethOSaddress
        self.accountURL = accountURL
    }
}
