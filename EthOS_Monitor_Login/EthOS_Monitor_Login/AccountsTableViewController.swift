//
//  AccountsTableViewController.swift
//  EthOS_Monitor_Login
//
//  Created by Bradley GIlmore on 9/15/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit
import CoreData

class AccountsTableViewController: UIViewController, NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noAccountsView: UIView!

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: .refreshTableView, object: nil)
        AccountController.shared.fetchResultsController.delegate = self
        
        self.areAccountsThere()
        self.addColors()
    }
    
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = AccountController.shared.fetchResultsController.fetchedObjects?.count else { return 0 }
        
        return section
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "accountsCell", for: indexPath) as? AccountsTableViewCell else { NSLog("AccountsTableViewCell Was Nil"); return UITableViewCell() }
        
        let account = AccountController.shared.fetchResultsController.object(at: indexPath)
        
        if account.nickName != "" {
            cell.accountNameLabel.text = account.nickName
        } else {
            cell.accountNameLabel.text = account.ethOSaddress
        }
        
        cell.backgroundColor = UIColor.backgroundTintGreen
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let account = AccountController.shared.fetchResultsController.object(at: indexPath)
            AccountController.shared.remove(account: account)
        }
    }
    
    //MARK: - Refreshing
    
    @objc func reloadTableData() {
        self.tableView.reloadData()
        self.areAccountsThere()
    }

    //MARK: - IBActions

    @IBAction func AddButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "EthOS Account", message: "Please enter you're EthOS Information", preferredStyle: .alert)
        
        alert.addTextField { (nickname) in
            nickname.placeholder = "nickname"
        }
        
        alert.addTextField { (username) in
            username.placeholder = "ethOS Distro Characters"
        }

        let createAction = UIAlertAction(title: "Create", style: .default) { (_) in
            
            // Get the values out of the textField
            guard let nickName = alert.textFields?[0].text else { return }
            guard let ethOSDistroCharacters = alert.textFields?[1].text else { return }
            
            // Make sure there's something in the required ethOSCharacters field
            if ethOSDistroCharacters.isEmpty {
                let errorAlert = self.showAlertController(title: "Error", body: "EthOS Distro Characters Text Field can't be empty")
                self.present(errorAlert, animated: true)
                return
            }
            
            AccountController.shared.createAccount(nickName: nickName, ethOSaddress: ethOSDistroCharacters)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(createAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }

    // MARK: - Navigation

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

//MARK: - Helpers

extension AccountsTableViewController {
    
    // Alerts
    
    func showAlertController(title: String, body: String) -> UIAlertController {
        // Create UIAlertController with the given title, and body text.
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        
        // Add an action that reads OK and will get rid of the UIAlertController
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // Add that action to the UIAlertController
        alert.addAction(okAction)
        
        // Return the UIAlertController
        return alert
    }
    
    // Colors / Design
    
    func areAccountsThere() {
        if AccountController.shared.fetchResultsController.fetchedObjects?.count == 0 {
            self.tableView.isHidden = true
        } else {
            self.tableView.isHidden = false
        }
    }

    func addColors() { //TODO: - I Don't really know what color to pick?
        self.navigationController?.navigationBar.barTintColor = UIColor.backgroundDarkerGreen
        self.tableView.backgroundColor = UIColor.backgroundTintGreen
        self.noAccountsView.backgroundColor = UIColor.backgroundTintGreen
    }
    
}
