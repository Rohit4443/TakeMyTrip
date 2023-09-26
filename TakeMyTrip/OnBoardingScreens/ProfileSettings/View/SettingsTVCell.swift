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
        vWPubPriv.layer.shadowColor = UIColor(r: 165, g: 165, b: 165, a: 0.25).cgColor
        vWPubPriv.shadowRadius = 2
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    
        
    }
    
    
}
