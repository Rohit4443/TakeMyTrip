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

class CommentsVC: UIViewController, UITableViewDataSource, UITableViewDelegate, CommentsTVCDelegate {
    
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // Each comment row will include the original comment and its replies (if expanded)
           let comment = comments[section]
           return comment.isExpanded ? comment.replies.count + 1 : 1
       }
    
    
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = comments[indexPath.section]
        
        if indexPath.row == 0 { // Display the original comment
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTVC", for: indexPath) as! CommentsTVC
            cell.delegate = self
            cell.lblTextComment.text = comment.text
            return cell
        } else { // Display reply comments
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyCommentsTVC", for: indexPath) as! ReplyCommentsTVC
            let replyIndex = indexPath.row - 1 // Subtract 1 to get the correct reply index
            cell.lblTextReply.text = comment.replies[replyIndex]
            cell.isHidden = !comment.isExpanded
            return cell
        }
    }
    
    func didTapReplyButton(in cell: CommentsTVC) {
        guard let indexPath = tblCommentsList.indexPath(for: cell) else {
            return
        }
        
        let comment = comments[indexPath.row]
        comment.isExpanded.toggle()
        comments[indexPath.row] = comment
        
        tblCommentsList.beginUpdates()
        tblCommentsList.reloadRows(at: [indexPath], with: .automatic)
        tblCommentsList.endUpdates()
    }
}
