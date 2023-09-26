//
//  EditPostScreenVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 14/09/23.
//

import UIKit

class EditPostScreenVC: UIViewController {
    @IBOutlet weak var vWAddActivityView: UIView!
    @IBOutlet weak var btnDeleteActivities: UIButton!
    @IBOutlet weak var lblMaxActivities: UILabel!
    @IBOutlet weak var lblEditPost: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblHorizontalLine: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtFldNameOfTrip: UITextField!
    @IBOutlet weak var txtFldTypeofTrip: UITextField!
    @IBOutlet weak var txtFldCountofDays: UITextField!
    @IBOutlet weak var txtViewDiscription: UITextView!
        
    @IBOutlet weak var vWDiscriptionBg: UIView!
    
    var selectedTextField: UITextField?
    var isPostMode = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtFldNameOfTrip.addPaddingToTextfield()
        self.txtFldTypeofTrip.addPaddingToTextfield()
        self.txtFldCountofDays.addPaddingToTextfield()
        txtFldNameOfTrip.delegate = self
        txtFldTypeofTrip.delegate = self
        txtFldCountofDays.delegate = self
        vWAddActivityView.layer.masksToBounds = false
        
        
    }
        
        override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                
                // Update the navigation bar title based on isPostMode
                self.navigationItem.title = isPostMode ? "Create Trip" : "Edit Post"
            
    }
    
    @IBAction func actionBack(_ sender: Any) {
        popVC()
    }
    
    
    @IBAction func actionSave(_ sender: UIButton) {
        
//        if isPostMode {
//            // Handle "Post" action
//            // For example, perform some actions here
//
//            // Change the button title back to "Save"
//            sender.setTitle("Save", for: .normal)
//
//            // Toggle the navigation mode
//            isPostMode.toggle()
//        } else {
//            // Handle "Save" action
//            // For example, perform some actions here
//
//            // Change the button title to "Post"
//            sender.setTitle("Post", for: .normal)
//
//            // Toggle the navigation mode
//            isPostMode.toggle()
//        }
//            // Perform navigation here, if needed
//            let vc = EditPostScreenVC() // Replace with your desired view controller
//            self.navigationController?.pushViewController(vc, animated: true)
//        self.navigationItem.title = isPostMode ? "Post" : "Save"
//
    }
    
    
    
}


//MARK: - TextField Delegate -
extension EditPostScreenVC : UITextFieldDelegate{
    
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



