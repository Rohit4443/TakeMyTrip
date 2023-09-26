//
//  EditDeletePostPopUpVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 06/09/23.
//

import UIKit

class EditDeletePostPopUpVC: UIViewController {

    @IBOutlet var vWContentView: UIView!
    var controller : UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapgesture))
                vWContentView.addGestureRecognizer(tapGesture)
    }

    @objc func tapgesture(){
            dismiss(animated: true)}
    
    @IBAction func actionEditPost(_ sender: UIButton) {
        let vc = EditPostScreenVC()
        controller?.pushViewController(vc, true)
       dismiss(animated: true)
    }
    
}
