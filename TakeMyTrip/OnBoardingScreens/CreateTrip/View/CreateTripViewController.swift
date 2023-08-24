//
//  CreateTripViewController.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 14/08/23.
//

import UIKit

class CreateTripViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var txtFldSelectOne: UITextField!
    @IBOutlet weak var txtFldTypeOfTrip: UITextField!
    @IBOutlet weak var txtFldNameOfTrip: UITextField!
    @IBOutlet weak var txtFldOfDays: UITextField!
    var selectedTextField: UITextField?
    @IBOutlet weak var btnCheckPrivate: UIButton!
    @IBOutlet weak var btnCheckPublic: UIButton!
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
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        
        // Set the border color of the selected text field to rgba
        textField.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
        
        // Reset the border color of the previously selected text field to clear
        if let lastSelected = selectedTextField, lastSelected != textField {
            lastSelected.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Reset the border color to clear when the text field becomes inactive
        textField.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func actionAddActivities(_ sender: UIButton) {
        let vc = AddActivitiesVC()
        self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func actionCheckPublic(_ sender: UIButton) {
        sender.isSelected.toggle()
        btnCheckPrivate.isSelected = false
        
    }
    
    @IBAction func actionCheckPrivate(_ sender: UIButton) {
        sender.isSelected.toggle()
        btnCheckPublic.isSelected = false
    }
}
