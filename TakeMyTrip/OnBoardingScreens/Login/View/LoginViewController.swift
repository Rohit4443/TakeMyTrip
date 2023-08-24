//
//  LoginViewController.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 09/08/23.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var selectedTextField: UITextField?
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var passwordVisibilty: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.delegate = self
        txtPassword.delegate = self
        self.txtEmail.addPaddingToTextfield()
        self.txtPassword.addPaddingToPasswordTextField()
        
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
    
    @IBAction func actionPassVisibilty(_ sender: UIButton) {
        
    }
    
    @IBAction func actionForgotPass(_ sender: UIButton) {
        let vc = ForgotPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        let vc = TabBarVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func actionSignUp(_ sender: UIButton) {
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
