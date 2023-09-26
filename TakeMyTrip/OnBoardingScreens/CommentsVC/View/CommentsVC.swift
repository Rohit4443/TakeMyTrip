//
//  CommentsVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 24/08/23.
//
import UIKit

class Comment {
    var text: String
    var replies: [String]
    var isExpanded: Bool

    init(text: String, replies: [String]) {
        self.text = text
        self.replies = replies
        self.isExpanded = false
    }
}

class CommentsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var viewContentView: UIView!
    @IBOutlet weak var tblCommentsList: UITableView!
    
    
    
    var comments: [Comment] = [
        Comment(text: "This is a comment", replies: ["Reply 1", "Reply 2"]),
        Comment(text: "Another comment", replies: []),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblCommentsList.dataSource = self
        tblCommentsList.delegate = self
        tblCommentsList.register(UINib(nibName: "CommentsTVC", bundle: nil), forCellReuseIdentifier: "CommentsTVC")
        tblCommentsList.register(UINib(nibName: "ReplyCommentsTVC", bundle: nil), forCellReuseIdentifier: "ReplyCommentsTVC")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapgesture))
                viewContentView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapgesture(){
            dismiss(animated: true)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return 4
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTVC", for: indexPath) as! CommentsTVC
       
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "ReplyCommentsTVC", for: indexPath) as! ReplyCommentsTVC
        
        switch indexPath.row {
        case 0:
            cell.vWSeeReply.isHidden = false
            return cell
        case 1:
            return cell2
        case 2:
            return cell2
        case 3:
            cell.vWSeeReply.isHidden = true
            return cell
            
        default:
            return UITableViewCell()
        }
        
   
    }
}
