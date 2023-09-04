//
//  CreateTripViewController.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 14/08/23.
//

import UIKit

@available(iOS 14.0, *)
class CreateTripViewController: UIViewController{
    
    // MARK: - IB Outlets -
    @IBOutlet weak var txtFldSelectOne: UITextField!
    @IBOutlet weak var txtFldTypeOfTrip: UITextField!
    @IBOutlet weak var txtFldNameOfTrip: UITextField!
    @IBOutlet weak var txtFldOfDays: UITextField!
    @IBOutlet weak var btnCheckPrivate: UIButton!
    @IBOutlet weak var btnCheckPublic: UIButton!
    
    
    // MARK: - Variables -
    var selectedTextField: UITextField?
    
    
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
    }
    
    
    
    
    //MARK: - IBAction -
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




//MARK: - TextField Delegate -

extension CreateTripViewController:UITextFieldDelegate{
    
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
