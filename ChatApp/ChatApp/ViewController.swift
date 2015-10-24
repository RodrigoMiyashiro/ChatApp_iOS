//
//  ViewController.swift
//  ChatApp
//
//  Created by Rodrigo A E Miyashiro on 10/23/15.
//  Copyright © 2015 Rodrigo A E Miyashiro. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    // MARK: - Constraints
    @IBOutlet weak var dockViewHeightContraints: NSLayoutConstraint!
    
    
    // MARK: - Variables and Constants
    var messagesArray: [String] = [String]()
    
    
    // MARK: - IBOutlet's
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        // Set Delegate and DataSource from TableView (messageTableView)
        self.messageTableView.delegate = self
        self.messageTableView.dataSource = self
        
        // Set self as the delegate for the textField
        self.messageTextField.delegate = self
        
        
        // Add a tap gesture recognizer to the tableView
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tableViewTapped")
        self.messageTableView.addGestureRecognizer(tapGesture)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - TableView DataSource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messagesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier = "MessageCell"
        let cell = self.messageTableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) 
        
        cell.textLabel?.text = "ABC"
        
        return cell
        
    }
    
    
    // MARK: - TableView Delegate Methods
    
    
    
    // MARK: - Gesture Recognizer Method
    func tableViewTapped () {
        
        // Force the textField to end editing
        self.messageTextField.endEditing(true)
        
    }
    
    
    // MARK: - TextField Delegate Methods
    func textFieldDidBeginEditing(textField: UITextField) {
        
        // Perform an animation to grow the dockView
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.5, animations: {
            
            self.dockViewHeightContraints.constant = 330
            self.view.layoutIfNeeded()
            
            }, completion: nil)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        // Perform an animation to grow the dockView
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.5, animations: {
            
            self.dockViewHeightContraints.constant = 82
            self.view.layoutIfNeeded()
            
            }, completion: nil)
    }

    
    // MARK - IBAction's Methods
    @IBAction func sendBtnTapped(sender: AnyObject) {
        
        // Send button is tapped
        
        // Call the end editing method for the textField
        self.messageTextField.endEditing(true)
        
    }
    
}

