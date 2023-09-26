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
    
    @IBOutlet weak var vWBioBg: UIView!
    
    //MARK: - Variables -
    var selectedTextField: UITextField?
    let pickerView = UIPickerView()
    var arraypickerList = ["one","two","three","four"]
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldFirstName.delegate = self
        txtFldLastName.delegate = self
        txtFldWhatTypeOfTraveler.delegate = self
        txtFldGender.delegate = self
        txtFldAge.delegate = self
        txtVwBio.delegate = self
        
        self.txtFldFirstName.addPaddingToTextfield()
        self.txtFldLastName.addPaddingToTextfield()
        self.txtFldWhatTypeOfTraveler.addPaddingToPasswordTextField()
        self.txtFldGender.addPaddingToTextfield()
        self.txtFldAge.addPaddingToTextfield()
        
        vWBioBg.layer.borderWidth = 0.4
        vWBioBg.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        
        pickerView.delegate = self
        pickerView.dataSource = self
        txtFldWhatTypeOfTraveler.inputView = pickerView
        
        addDoneButtonToPickerView()
        
    }
    
    
    
    func addDoneButtonToPickerView() {
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
            toolbar.setItems([doneButton], animated: false)
        txtFldWhatTypeOfTraveler.inputAccessoryView = toolbar
        }

        @objc func doneButtonTapped() {
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            txtFldWhatTypeOfTraveler.text = arraypickerList[selectedRow]
            txtFldWhatTypeOfTraveler.resignFirstResponder()
        }

    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func actionSelectTravelerType(_ sender: UIButton) {
    
        
        txtFldWhatTypeOfTraveler.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        txtFldWhatTypeOfTraveler.layer.borderWidth = 0.4

            
              selectedTextField = txtFldWhatTypeOfTraveler
              selectedTextField?.inputView = pickerView
              
              
              selectedTextField?.becomeFirstResponder()
    }
    
}


//MARK: - TextField Delegate -
extension EditProfileVC : UITextFieldDelegate{
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        txtFldWhatTypeOfTraveler.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        txtFldWhatTypeOfTraveler.layer.borderWidth = 0.4
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

extension EditProfileVC : UITextViewDelegate{

    func textViewDidBeginEditing(_ textView: UITextView) {

        vWBioBg.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
        vWBioBg.layer.borderWidth = 1
    }
    func textViewDidEndEditing(_ textView: UITextView) {

        
        vWBioBg.layer.borderWidth = 0.4
        vWBioBg.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        
    }
    }


extension EditProfileVC : UIPickerViewDelegate, UIPickerViewDataSource{
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
        self.txtFldWhatTypeOfTraveler.text = arraypickerList[row]
       
       

    }
    
}
