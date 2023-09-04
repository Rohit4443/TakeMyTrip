//
//  AddNewActivityCVCell.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 01/09/23.
//

import UIKit

class AddNewActivityCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imgAdd: UIImageView!
    @IBOutlet weak var btnDelete: UIButton! // Add a delete button outlet
    
    var deleteButtonAction: (() -> Void)? // A closure to handle delete button action
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Configure the cell
        btnDelete.isHidden = true 
        btnDelete.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    @objc func deleteButtonTapped() {
        // Handle the delete button action
        deleteButtonAction?()
    }
}
