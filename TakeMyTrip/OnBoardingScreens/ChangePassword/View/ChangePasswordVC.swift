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
    
    
    
    //MARK: - Variables -
    var selectedTextField: UITextField?
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldOldPass.delegate = self
        txtFldNewPass.delegate = self
        txtFldReNewPass.delegate = self
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = true
    }
    
}


//MARK: - TextField Delegate -
extension ChangePasswordVC: UITextFieldDelegate{
    
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
