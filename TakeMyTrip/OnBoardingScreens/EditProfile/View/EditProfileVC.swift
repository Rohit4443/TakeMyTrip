//
//  EditProfileVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 23/08/23.
//

import UIKit

class EditProfileVC: UIViewController {
    
    //MARK: - IBOutlets -
    @IBOutlet weak var txtFldFirstName: UITextField!
    @IBOutlet weak var txtFldLastName: UITextField!
    @IBOutlet weak var txtFldWhatTypeOfTraveler: UITextField!
    @IBOutlet weak var txtFldGender: UITextField!
    @IBOutlet weak var txtFldAge: UITextField!
    @IBOutlet weak var txtVwBio: UITextView!
    @IBOutlet weak var btnSave: UIButton!
    
    
    //MARK: - Variables -
    var selectedTextField: UITextField?
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldFirstName.delegate = self
        txtFldLastName.delegate = self
        txtFldWhatTypeOfTraveler.delegate = self
        txtFldGender.delegate = self
        txtFldAge.delegate = self
        
        self.txtFldFirstName.addPaddingToTextfield()
        self.txtFldLastName.addPaddingToTextfield()
        self.txtFldWhatTypeOfTraveler.addPaddingToPasswordTextField()
        self.txtFldGender.addPaddingToTextfield()
        self.txtFldAge.addPaddingToTextfield()
        
        
    }
    
    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
    }
    
}


//MARK: - TextField Delegate -
extension EditProfileVC : UITextFieldDelegate{
    
    
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
