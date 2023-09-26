//
//  HomeSecondCVCell.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 10/08/23.
//

import UIKit

class HomeSecondCVCell: UICollectionViewCell {
    
    
    @IBOutlet weak var btnReport: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnForward: UIButton!
    @IBOutlet weak var btnUpArrow: UIButton!
    @IBOutlet weak var btnBackHide: UIButton!
    @IBOutlet weak var imgHomePost: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btnUpArrow.isHidden = true
        self.btnBackHide.isHidden = true
        
    }
}
