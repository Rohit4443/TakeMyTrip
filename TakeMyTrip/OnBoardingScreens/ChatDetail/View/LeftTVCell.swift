//
//  LeftTVCell.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 17/08/23.
//

import UIKit

class LeftTVCell: UITableViewCell {
    @IBOutlet weak var lblLeftCell: UILabel!
    
    @IBOutlet weak var vWBgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        vWBgView.layer.masksToBounds = false // Ensure it's not clipping content
        vWBgView.layer.shadowRadius = 4    // Adjust the shadow radius as needed
        vWBgView.layer.shadowOpacity = 0.1 // Adjust the shadow opacity as needed
        vWBgView.layer.shadowOffset = .zero
        vWBgView.layer.shadowColor = UIColor.systemGray.cgColor

        // You can also set a background color for vWBgView for better visibility
        vWBgView.backgroundColor = .white // or any other color

        // Check for any superview's clipsToBounds property, and set it to false if necessary
        self.contentView.clipsToBounds = false // assuming vWBgView is in the cell's content view


    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
