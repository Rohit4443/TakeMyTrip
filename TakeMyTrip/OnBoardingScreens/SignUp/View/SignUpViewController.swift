//
//  SignUpViewController.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 09/08/23.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var txtFldFirstName: UITextField!
    @IBOutlet weak var txtFldLastName: UITextField!
    @IBOutlet weak var txtFldWhatTypeofTraveler: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    var selectedTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldFirstName.delegate = self
        txtFldLastName.delegate = self
        txtFldWhatTypeofTraveler.delegate = self
        txtFldPassword.delegate = self
        txtFldEmail.delegate = self
        self.txtFldFirstName.addPaddingToTextfield()
        self.txtFldLastName.addPaddingToTextfield()
        self.txtFldWhatTypeofTraveler.addPaddingToPasswordTextField()
        self.txtFldPassword.addPaddingToPasswordTextField()
        self.txtFldEmail.addPaddingToTextfield()
        self.navigationController?.isNavigationBarHidden = true
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
    
    
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

