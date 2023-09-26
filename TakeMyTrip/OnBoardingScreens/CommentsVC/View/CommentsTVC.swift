//
//  CommentsTVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 28/08/23.
//
import UIKit

class CommentsTVC: UITableViewCell {
    @IBOutlet weak var btnShowReplyComents: UIButton!
    @IBOutlet weak var lblTextComment: UILabel!
    @IBOutlet weak var vWBackground1: UIView!
    @IBOutlet weak var lblTextReply: UILabel!
    
    @IBOutlet weak var vWSeeReply: UIView!
    weak var delegate: CommentsTVCDelegate?
    var replies: [String] = [] {
        didSet {
            lblTextReply.text = replies.joined(separator: "\n")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func showHideReplies(_ sender: UIButton) {
        delegate?.didTapReplyButton(in: self)
    }
    
    func hideReplyComments() {
           lblTextReply.text = ""
       }
}

protocol CommentsTVCDelegate: AnyObject {
    func didTapReplyButton(in cell: CommentsTVC)
}
