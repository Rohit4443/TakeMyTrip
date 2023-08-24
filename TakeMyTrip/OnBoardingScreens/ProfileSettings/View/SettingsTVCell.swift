//
//  SettingsTVCell.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 19/08/23.
//

import UIKit

class SettingsTVCell: UITableViewCell {
    
    @IBOutlet weak var lbltext: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPublic: UIButton!
    @IBOutlet weak var BtnPrivate: UIButton!
    @IBOutlet weak var vWPubPriv: UIView!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
    
    
}
