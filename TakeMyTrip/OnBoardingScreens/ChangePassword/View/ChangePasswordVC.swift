//
//  ChangePasswordVC.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 20/08/23.
//

import UIKit

class ChangePasswordVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtFldOldPass: UITextField!
    @IBOutlet weak var txtFldNewPass: UITextField!
    @IBOutlet weak var txtFldReNewPass: UITextField!
    var selectedTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldOldPass.delegate = self
        txtFldNewPass.delegate = self
        txtFldReNewPass.delegate = self
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        
        // Set the border color of the selected text field to rgba
        textField.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
        
        // Reset the border color of the previously selected text field to clear
        if let lastSelected = selectedTextField, lastSelected != textField {
            lastSelected.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Reset the border color to clear when the text field becomes inactive
        textField.layer.borderColor = UIColor.clear.cgColor
    }
}

