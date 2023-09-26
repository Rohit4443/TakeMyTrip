//
//  ChangePasswordVC.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 20/08/23.
//

import UIKit

class ChangePasswordVC: UIViewController {
    
    
    //MARK: - IBOutlets -
    @IBOutlet weak var txtFldOldPass: UITextField!
    @IBOutlet weak var txtFldNewPass: UITextField!
    @IBOutlet weak var txtFldReNewPass: UITextField!
    @IBOutlet weak var btnOldPassVisibilty: UIButton!
    @IBOutlet weak var btnNewPassVisibilty: UIButton!
    @IBOutlet weak var btnReEnterPassVisibilty: UIButton!
    
    //MARK: - Variables -
    var selectedTextField: UITextField?
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldOldPass.delegate = self
        txtFldNewPass.delegate = self
        txtFldReNewPass.delegate = self
        txtFldOldPass.addPaddingToPasswordTextField()
        txtFldNewPass.addPaddingToPasswordTextField()
        txtFldReNewPass.addPaddingToPasswordTextField()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func actionOldPassVisibilty(_ sender: UIButton) {
        switch sender.tag {
                case 0:
                    sender.isSelected.toggle()
                    txtFldOldPass.isSecureTextEntry = !sender.isSelected
                case 1:
                    sender.isSelected.toggle()
                    txtFldNewPass.isSecureTextEntry = !sender.isSelected
                case 2:
                    sender.isSelected.toggle()
                    txtFldReNewPass.isSecureTextEntry = !sender.isSelected
                default:
                    break
                }
        
        
    }
    
   
    
}


//MARK: - TextField Delegate -
extension ChangePasswordVC: UITextFieldDelegate{
    
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
