//
//  BlockReportPopUpVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 07/09/23.
//

import UIKit

class BlockReportPopUpVC: UIViewController {

    @IBOutlet var vWContainerView: UIView!
    var controller : UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapgesture))
                vWContainerView.addGestureRecognizer(tapGesture)
     
    }
    
    @objc func tapgesture(){
            dismiss(animated: true)
        
        
    }
    
    
    @IBAction func actionBlockUser(_ sender: UIButton) {
        let vc = BlockedUserVC()
        controller?.pushViewController(vc, true)
       dismiss(animated: true)
    }
    
}
