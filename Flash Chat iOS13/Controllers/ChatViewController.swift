//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

//MARK: - UIViewController
class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let firebaseAuth = Auth.auth()
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
        // tableView.delegate = self
    }
        
    //MARK: - sendPressed()
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text,
            let messageSender = firebaseAuth.currentUser?.email {
                if messageBody != "" {
                    db.collection(K.Firestore.collectionName).addDocument(data: [
                        K.Firestore.senderField: messageSender,
                        K.Firestore.bodyField: messageBody,
                        K.Firestore.dateField: Date().timeIntervalSince1970
                    ]) { (error) in
                        if let e = error {
                            print("There was an issue saving data to Firestore, \(e)")
                        } else {
                            print("Successfully saved data.")
                            DispatchQueue.main.async {
                                self.messageTextfield.text = ""
                            }
                        }
                    }
                }
        }
    }
    
    //MARK: - logOutPressed()
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    //MARK: - loadMessages()
    func loadMessages() {
        db.collection(K.Firestore.collectionName)
            .order(by: K.Firestore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
                self.messages = []
            
                if let e = error {
                    print("There was an issue retrieving data from Firestore, \(e)")
                } else {
                    //Optionally bind the documents to make sure that they are not nil
                    if let snapshotDocs = querySnapshot?.documents {
                        for doc in snapshotDocs {
                            //Get the actual data from the Firestore object
                            let messageData = doc.data()
                            //Optionally bind the sender and body to check that they are not nil
                            if let messageSender  = messageData[K.Firestore.senderField] as? String, let messageBody = messageData[K.Firestore.bodyField] as? String {
                                //Create a message object from the obtained sender and body
                                let newMessage = Message(messageSender, messageBody)
                                //Add the created message to the array of all messages
                                self.messages.append(newMessage)
                                //Update the interface
                                DispatchQueue.main.async {
                                    //Update the data to display the new messages
                                    self.tableView.reloadData()
                                    //Index of the latest message
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    //Scroll to the latest message
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                }
                            }
                        }
                    }
                }
        }
    }
}

//MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //contains a sender and a body
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        //Customizing the cell
        //This is a message from the currently logged in user
        if message.sender == firebaseAuth.currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        } else {    //The message came from the other user(s)
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        }
    
        return cell
    }
}

////MARK: - UITableViewDelegate
//extension ChatViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//}
