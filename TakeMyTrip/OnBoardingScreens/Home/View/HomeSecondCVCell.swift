//
//  HomeSecondCVCell.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 10/08/23.
//

import UIKit

class HomeSecondCVCell: UICollectionViewCell {
    
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var btnSelectOption: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnForward: UIButton!
    
    //    @IBOutlet weak var view1: UIView!
    //    @IBOutlet weak var view2: UIView!
    //    @IBOutlet weak var view3: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //        self.PageControl.numberOfPages = 4
        //        self.PageControl.currentPage = 0
        //        self.PageControl.tintColor = UIColor.red
        //        self.PageControl.pageIndicatorTintColor = UIColor.black
        //        self.PageControl.currentPageIndicatorTintColor = UIColor.green
        
    }
    
    @IBAction func ChangePage(_ sender: UIPageControl) {
    }
    
}

