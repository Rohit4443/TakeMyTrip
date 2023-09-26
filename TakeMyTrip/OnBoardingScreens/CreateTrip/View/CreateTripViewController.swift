//
//  CreateTripViewController.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 14/08/23.
//

import UIKit


class CreateTripViewController: UIViewController{
    
    // MARK: - IB Outlets -
    @IBOutlet weak var txtFldSelectOne: UITextField!
    @IBOutlet weak var txtFldTypeOfTrip: UITextField!
    @IBOutlet weak var txtFldNameOfTrip: UITextField!
    @IBOutlet weak var txtFldOfDays: UITextField!
    @IBOutlet weak var btnCheckPrivate: UIButton!
    @IBOutlet weak var btnCheckPublic: UIButton!
    @IBOutlet weak var vWAddActivity: UIView!
    
    // MARK: - Variables -
    var selectedTextField: UITextField?
    let pickerView = UIPickerView()
    var arraypickerList = ["one","two","three","four"]
    
    // MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldSelectOne.delegate = self
        txtFldTypeOfTrip.delegate = self
        txtFldNameOfTrip.delegate = self
        txtFldOfDays.delegate = self
        self.txtFldSelectOne.addPaddingToPasswordTextField()
        self.txtFldTypeOfTrip.addPaddingToTextfield()
        self.txtFldNameOfTrip.addPaddingToTextfield()
        self.txtFldOfDays.addPaddingToTextfield()
        vWAddActivity.isHidden = true
       
        
        pickerView.delegate = self
        pickerView.dataSource = self
        txtFldSelectOne.inputView = pickerView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    
    //MARK: - IBAction -
    @IBAction func actionAddActivities(_ sender: UIButton) {
        let vc = AddActivitiesVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    
    @IBAction func actionCheckPublic(_ sender: UIButton) {
        sender.isSelected.toggle()
        btnCheckPrivate.isSelected = false
        
    }
    
    @IBAction func actionCheckPrivate(_ sender: UIButton) {
        sender.isSelected.toggle()
        btnCheckPublic.isSelected = false
    }
    
    @IBAction func actionPost(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [self] in
                       
                        self.navigationController?.tabBarController?.selectedIndex = 0
            
                       
                    })
        
    }
    
    
    @IBAction func actionSelectCompletetrip(_ sender: UIButton) {
        txtFldSelectOne.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
        txtFldSelectOne.borderWidth = 1
        
    }
    
    
    @IBAction func actionSelectOne(_ sender: UIButton) {
        
        txtFldSelectOne.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        txtFldSelectOne.layer.borderWidth = 0.4

            
              selectedTextField = txtFldSelectOne
              selectedTextField?.inputView = pickerView
              
              
              selectedTextField?.becomeFirstResponder()
    }
    
    
    
}




//MARK: - TextField Delegate -

extension CreateTripViewController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        
        txtFldSelectOne.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        txtFldSelectOne.layer.borderWidth = 0.4
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



extension CreateTripViewController : UIPickerViewDelegate, UIPickerViewDataSource{
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
        self.txtFldSelectOne.text = arraypickerList[row]
        self.view.endEditing(true)
        selectedTextField?.resignFirstResponder()

    }
    
}
