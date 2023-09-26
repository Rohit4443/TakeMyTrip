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
    let pickerView = UIPickerView()
    var arraypickerList = ["one","two","three","four"]
    
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
        
        pickerView.delegate = self
        pickerView.dataSource = self
        txtFldTripCategory.inputView = pickerView
        
        addDoneButtonToPickerView()
        
    }
    
    
    
    func addDoneButtonToPickerView() {
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
            toolbar.setItems([doneButton], animated: false)
            txtFldTripCategory.inputAccessoryView = toolbar
        }

        @objc func doneButtonTapped() {
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            txtFldTripCategory.text = arraypickerList[selectedRow]
            txtFldTripCategory.resignFirstResponder()
        }

    //MARK: - IBAction -
    
    
   
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func actionSelectTripCategory(_ sender: UIButton) {
        txtFldTripCategory.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        txtFldTripCategory.layer.borderWidth = 0.4

            
              selectedTextField = txtFldTripCategory
              selectedTextField?.inputView = pickerView
              
              
              selectedTextField?.becomeFirstResponder()
    }
    
    
    
}

extension FilterVC : UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        txtFldTripCategory.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        txtFldTripCategory.layer.borderWidth = 0.4
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


extension FilterVC : UIPickerViewDelegate, UIPickerViewDataSource{
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
        self.txtFldTripCategory.text = arraypickerList[row]
     
       
    }
    
}
