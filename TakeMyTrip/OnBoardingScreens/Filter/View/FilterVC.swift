//
//  FilterVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 23/08/23.
//

import UIKit

class FilterVC: UIViewController {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var txtFldPlace: UITextField!
    @IBOutlet weak var txtFldNumberOfDays: UITextField!
    @IBOutlet weak var txtFldTripCategory: UITextField!
    
    
    //MARK: - Variables -
    var selectedTextField: UITextField?
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldPlace.delegate = self
        txtFldNumberOfDays.delegate = self
        txtFldTripCategory.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        
        self.txtFldPlace.addPaddingToTextfield()
        self.txtFldNumberOfDays.addPaddingToTextfield()
        self.txtFldTripCategory.addPaddingToPasswordTextField()
        
    }
    
    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = false
    }
    
}

extension FilterVC : UITextFieldDelegate{
    
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
