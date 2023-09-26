//
//  TripActivityOverlayCVCell.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 31/08/23.
//

import UIKit

class TripActivityOverlayCVCell: UICollectionViewCell {
    @IBOutlet weak var btnBack: UIButton!
    weak var delegate: TripActivityOverlayCVCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
     
        btnBack.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
    }
    
    @objc func backButtonPressed() {
            delegate?.didPressBackButton()
        }
    
    }

protocol TripActivityOverlayCVCellDelegate: AnyObject {
    func didPressBackButton()
}
