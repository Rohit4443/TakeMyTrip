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
    @IBOutlet weak var btnVisibility: UIButton!
    @IBOutlet weak var btnPickerOpen: UIButton!
    
    //MARK: - Variables -
    
    var selectedTextField: UITextField?
    let pickerView = UIPickerView()
    var arraypickerList = ["one","two","three","four","five"]
    
    
    
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
        
        pickerView.delegate = self
        pickerView.dataSource = self
        txtFldWhatTypeofTraveler.inputView = pickerView
   
        
        addDoneButtonToPickerView()
        
    }
    
    
    
    func addDoneButtonToPickerView() {
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
            toolbar.setItems([doneButton], animated: false)
        txtFldWhatTypeofTraveler.inputAccessoryView = toolbar
        }

        @objc func doneButtonTapped() {
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            txtFldWhatTypeofTraveler.text = arraypickerList[selectedRow]
            txtFldWhatTypeofTraveler.resignFirstResponder()
        }


    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func actionPassVisibilty(_ sender: UIButton) {
        sender.isSelected.toggle()
        txtFldPassword.isSecureTextEntry = !sender.isSelected
    }
    
    
    @IBAction func ActionTypeTravelerSelect(_ sender: UIButton) {
        txtFldWhatTypeofTraveler.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
        txtFldWhatTypeofTraveler.borderWidth = 1
    }
    
    @IBAction func actionPickerOpen(_ sender: UIButton) {
        txtFldWhatTypeofTraveler.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
              txtFldWhatTypeofTraveler.layer.borderWidth = 0.4

            
              selectedTextField = txtFldWhatTypeofTraveler
              selectedTextField?.inputView = pickerView
              
              
              selectedTextField?.becomeFirstResponder()
    }
    
    }
    

//MARK: - TextField Delegate -
extension SignUpViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        txtFldWhatTypeofTraveler.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        txtFldWhatTypeofTraveler.layer.borderWidth = 0.4
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

extension SignUpViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arraypickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arraypickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtFldWhatTypeofTraveler.text = arraypickerList[row]
      
      

    }
    
}

