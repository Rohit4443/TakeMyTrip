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
    
    //       override func awakeFromNib() {
    //           super.awakeFromNib()
    override var isSelected: Bool {
        didSet {
            
            if isSelected {
                vWBackground.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
                vWBackground.layer.borderWidth = 1
            } else {
                vWBackground.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
}
