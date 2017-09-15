//
//  AccountsTableViewController.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class AccountsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: .refreshTableView, object: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AccountController.shared.accounts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "accountsCell", for: indexPath) as? AccountsTableViewCell else { NSLog("AccountsTableViewCell Was Nil"); return UITableViewCell() }
        
        let account = AccountController.shared.accounts[indexPath.row]
        
        if account.nickName != "" {
            cell.accountNameLabel.text = account.nickName
        } else {
            cell.accountNameLabel.text = account.ethOSaddress
        }
        
        return cell
    }
    
    //MARK: - Refreshing
    
    func reloadTableData() {
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
        let account = AccountController.shared.accounts[indexPath.row]
        AccountController.fetchMinersFromAccount(account: account) { (accountInfo) in
            print(accountInfo.totalHashrate)//FIXME: - Obvious
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
