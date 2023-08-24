//
//  LeftTVCell.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 17/08/23.
//

import UIKit

class LeftTVCell: UITableViewCell {
    @IBOutlet weak var lblLeftCell: UILabel!
    
    @IBOutlet weak var vWLeftCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vWLeftCell.shadowRadius = 4
        self.vWLeftCell.shadowOpacity = 0.5
        self.vWLeftCell.shadowOffset = CGSize(width: 0, height: 0)
        self.vWLeftCell.shadowColor = .gray
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
