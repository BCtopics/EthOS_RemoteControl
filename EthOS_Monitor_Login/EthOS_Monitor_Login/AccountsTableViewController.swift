//
//  AccountsTableViewController.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit
import CoreData

class AccountsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: .refreshTableView, object: nil)
        AccountController.shared.fetchResultsController.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = AccountController.shared.fetchResultsController.fetchedObjects?.count else { return 0 }
        
        return section
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "accountsCell", for: indexPath) as? AccountsTableViewCell else { NSLog("AccountsTableViewCell Was Nil"); return UITableViewCell() }
        
        let account = AccountController.shared.fetchResultsController.object(at: indexPath)
        
        if account.nickName != "" {
            cell.accountNameLabel.text = account.nickName
        } else {
            cell.accountNameLabel.text = account.ethOSaddress
        }
        
        return cell
    }
    
    //MARK: - Refreshing
    
    @objc func reloadTableData() {
        self.tableView.reloadData()
    }
    
    //MARK: - IBActions
    
    // Add Button
    
    @IBAction func AddButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "EthOS Account", message: "Please enter EthOS Information", preferredStyle: .alert)
        
        alert.addTextField { (nickname) in
            nickname.placeholder = "nickName"
        }
        
        alert.addTextField { (username) in
            username.placeholder = "ethOS Distro Charactes"
        }

        //FIXME: - Fix Naming
        let createAction = UIAlertAction(title: "Create", style: .default) { (_) in
            guard let nickName = alert.textFields?[0].text else { return }
            guard let ethOSDistroCharacters = alert.textFields?[1].text else { return }
            
            AccountController.shared.createAccount(nickName: nickName, ethOSaddress: ethOSDistroCharacters)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(createAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let account = AccountController.shared.accounts[indexPath.row]
//        AccountController.fetchMinersFromAccount(account: account) { (accountInfo) in
//            print(accountInfo.totalHashrate)//FIXME: - Obvious
//        }
        
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            
            let account = AccountController.shared.fetchResultsController.object(at: indexPath)
            AccountController.shared.remove(account: account)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toMinersMain" {
            if let minersVC = segue.destination as? MinersMainViewController {
                guard let index = self.tableView.indexPathForSelectedRow else { NSLog("Index path invalid"); return }
                
                let account = AccountController.shared.fetchResultsController.object(at: index)
                minersVC.account = account
            }
        }
    }
    

}
