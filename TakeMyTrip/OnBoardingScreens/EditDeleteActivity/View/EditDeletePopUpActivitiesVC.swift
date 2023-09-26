//
//  EditDeletePopUpActivitiesVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 24/08/23.
//

import UIKit

class EditDeletePopUpActivitiesVC: UIViewController {
    
    @IBOutlet var viewContentView: UIView!
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapgesture))
                viewContentView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapgesture(){
            dismiss(animated: true)}
}
