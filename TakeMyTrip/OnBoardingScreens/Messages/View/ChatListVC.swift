//
//  MessagesVC.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 09/08/23.
//

import UIKit

class ChatListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblMessageList: UITableView!
    var arrayName = ["John","Emily","Michael","Emma","David","John","Emily","Michael","Emma","David","John"]
    var arraymessage = ["Thinking of you!","Have a great day!",  "You're amazing!","Keepsmiling!","Congratulations!","Sending hugs!","Thinking of you!","Have a great day!",  "You're amazing!","Keepsmiling!","Congratulations!"]
    var arrayimgProfile = ["img1","img2","img3","img4","img1","img2","img3","img4","img1","img3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMessageList.delegate = self
        tblMessageList.dataSource = self
        tblMessageList.register(UINib(nibName: "MessageTVCell", bundle: nil), forCellReuseIdentifier: "MessageTVCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTVCell", for: indexPath)as! MessageTVCell
        cell.lblName.text = arrayName[indexPath.row]
        cell.lblMessage.text = arraymessage[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            
            self.arrayName.remove(at: indexPath.row)
            self.arraymessage.remove(at: indexPath.row)
            self.arrayimgProfile.remove(at: indexPath.row)
            self.tblMessageList.deleteRows(at: [indexPath], with: .fade)
            
            
            completion(true)
        }
        
        // Set the delete icon
        let deleteIcon = UIImage(named: "ic_delete")
        deleteAction.image = deleteIcon
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false //HERE..
        return configuration
        
    }
    // did select method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("Cell \(indexPath.row + 1) clicked")
        let vc = ChatMessagesVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

