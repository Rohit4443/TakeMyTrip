//
//  SignUpViewController.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 09/08/23.
//

import UIKit

class SignUpViewController: UIViewController{
    
    
    //MARK: - IBOutlets -
    @IBOutlet weak var txtFldFirstName: UITextField!
    @IBOutlet weak var txtFldLastName: UITextField!
    @IBOutlet weak var txtFldWhatTypeofTraveler: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    
    //MARK: - Variables -
    var selectedTextField: UITextField?
    
    
    
    //MARK: - LifeCycleMethods -
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
    
    
    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


//MARK: - TextField Delegate -
extension SignUpViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        
        textField.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
        
        if let lastSelected = selectedTextField, lastSelected != textField {
            lastSelected.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        textField.layer.borderColor = UIColor.clear.cgColor
    }
    
}
