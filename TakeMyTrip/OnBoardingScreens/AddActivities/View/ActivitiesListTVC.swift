//
//  ActivitiesListTVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 24/08/23.
//

import UIKit

class ActivitiesListTVC: UITableViewCell {
    
    @IBOutlet weak var btnAddActivity: UIButton!
    @IBOutlet weak var lblActivityName: UILabel!
    @IBOutlet weak var vWBackground: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override var isSelected: Bool {
        didSet {
            // Update cell appearance based on selection state
            if isSelected {
                vWBackground.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
                vWBackground.layer.borderWidth = 1
            } else {
                vWBackground.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
}


