//
//  CommandsViewController.swift
//  EthOSRemoteLogin
//
//  Created by Bradley GIlmore on 9/13/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class CommandsViewController: UIViewController, CommandsViewControllerDelegate {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SessionController.shared.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        SessionController.shared.endConnection()
        NSLog("Ending Connection")
    }
    
    //MARK: - Properties
    
    static let shared = CommandsViewController()
    var simple = true
    
    //MARK: - Toggle Simple / Advanced
    
    func simpleOrAdvanced() {
        
        if self.simple {
            self.commandLineLabel.isHidden = true
            self.commandLineLabel.isSelectable = false
            self.simpleCommandLineLabel.isHidden = false
            //Add More Stuff Here
        } else {
            self.commandLineLabel.isHidden = false
            self.commandLineLabel.isSelectable = true
            self.simpleCommandLineLabel.isHidden = true
            // Add More Stuff Here
        }
    }
    
    //MARK: - Updates
    
    // Advanced
    
    func updateViews(message: String) {
        
        if !simple {
            DispatchQueue.main.async {
                
                self.commandLineLabel.text = "\(self.commandLineLabel.text!) \(message)"
                print("Should Be Updating")
            }
        } else {
            simpleUpdateViews(message: message)
        }
    }
    
    // Simple
    
    func simpleUpdateViews(message: String) {
        
        if message.contains("Sent updated stats to webhook!") {
            DispatchQueue.main.async {
                
                self.simpleCommandLineLabel.text = "Updates Have Been Sent To Panel"
                print("Simple Update Views Works")
            }
        }
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var commandLineLabel: UITextView!
    @IBOutlet weak var simpleCommandLineLabel: UILabel!
    
    //MARK: - IBActions
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        
        SessionController.shared.sendCommand(command: "update")
    }
    
    @IBAction func rebootButtonTapped(_ sender: Any) {
        
        SessionController.shared.sendCommand(command: "r")
    }
    
    @IBAction func simpleSwitchToggleTapped(_ sender: Any) {
        self.simple = !self.simple
        simpleOrAdvanced()
    }
}

