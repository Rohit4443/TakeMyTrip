//
//  ForgotPasswordVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 09/08/23.
//

import UIKit

class ForgotPasswordVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var txtFldEmail: UITextField!
    var selectedTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldEmail.delegate = self
        txtFldEmail.addPaddingToPasswordTextField()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        
        // Set the border color of the selected text field to rgba
        textField.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Reset the border color to clear when the text field becomes inactive
        textField.layer.borderColor = UIColor.clear.cgColor
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
