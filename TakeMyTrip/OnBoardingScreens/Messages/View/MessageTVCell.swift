//
//  MessageTVCell.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 16/08/23.
//

import UIKit

class MessageTVCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var vWShowOnline: UIView!
    @IBOutlet weak var lblUnreadMessage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vWShowOnline.layer.shadowOpacity = 1
        vWShowOnline.shadowRadius = 2
        vWShowOnline.shadowColor = .systemGray
        vWShowOnline.borderColor = .white
        vWShowOnline.borderWidth = 1
        
 
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
