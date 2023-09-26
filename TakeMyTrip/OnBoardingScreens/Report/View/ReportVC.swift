//
//  ReportVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 28/08/23.
//

import UIKit

class ReportVC: UIViewController {
    @IBOutlet var vWContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapgesture))
                vWContainerView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapgesture(){
            dismiss(animated: true)}

}
