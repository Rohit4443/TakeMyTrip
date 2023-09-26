//
//  ForgotPasswordVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 09/08/23.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    //MARK: - IBOutlets -.
    @IBOutlet weak var txtFldEmail: UITextField!
    var selectedTextField: UITextField?
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldEmail.delegate = self
        txtFldEmail.addPaddingToPasswordTextField()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    
    
    
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - TextField Delegate -
extension ForgotPasswordVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        
        textField.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
        textField.layer.borderWidth = 1
        
        if let lastSelected = selectedTextField, lastSelected != textField {
            textField.layer.borderColor = UIColor.clear.cgColor
            
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        textField.layer.borderWidth = 0.4
    }
}

