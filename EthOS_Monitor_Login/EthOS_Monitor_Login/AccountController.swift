//
//  AccountController.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation
import CoreData

class AccountController {
    
    //MARK: - Properties
    
    static let shared = AccountController()
    
    //MARK: - CoreData
    
    var fetchResultsController: NSFetchedResultsController<Account>
    
    init() {
        
        let request: NSFetchRequest<Account> = Account.fetchRequest()
        
        let sort = NSSortDescriptor(key: "ethOSaddress", ascending: true)
        
        request.sortDescriptors = [sort]
        
        fetchResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try fetchResultsController.performFetch()
        } catch {
            NSLog("\(error.localizedDescription)")
        }
    }
    
    func fetchResults() {
        do {
            try fetchResultsController.performFetch()
        } catch {
            NSLog("\(error.localizedDescription)")
        }
    }
    
    func saveToPersistentStore() {
        
        let moc = CoreDataStack.context
        
        do {
            try moc.save()
            fetchResults()
            NotificationCenter.default.post(name: .refreshTableView, object: nil)
        } catch {
            NSLog("Error saving \(error.localizedDescription)")
        }
        
    }
    
    func remove(account: Account) {
        
        let moc = CoreDataStack.context
        moc.delete(account)
        saveToPersistentStore()
    }
    
    //MARK: - Creator Methods
    
    func createAccount(nickName: String, ethOSaddress: String) {
        
        _ = Account(nickName: nickName, ethOSaddress: ethOSaddress, accountURL: createURL(ethOSaddress: ethOSaddress))
        saveToPersistentStore()
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
