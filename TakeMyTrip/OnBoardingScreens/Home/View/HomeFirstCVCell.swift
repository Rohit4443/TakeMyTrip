//
//  HomeFirstCVCell.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 10/08/23.
//

import UIKit

class HomeFirstCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imgfirst: UIImageView!
    
    @IBOutlet weak var lblFirst: UILabel!
    
    @IBOutlet weak var vWBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.vWBackground.layer.borderColor = UIColor.black.cgColor
//        self.vWBackground.layer.borderWidth = 1
        
        
    }
        override var isSelected: Bool {
            didSet {

                if isSelected {
                    vWBackground.layer.borderColor = UIColor.black.cgColor
                    vWBackground.layer.borderWidth = 1
                } else {
                    vWBackground.layer.borderColor = UIColor.systemGray.cgColor
                }
            }
        }
        
    }

