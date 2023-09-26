//
//  EditActivityVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 31/08/23.
//

import UIKit
import PhotosUI


class AddNewActivityVC: UIViewController {
    
    @IBOutlet weak var collActivityAdd: UICollectionView!
    
    @IBOutlet weak var btnNew: UIButton!
    @IBOutlet weak var btnExisting: UIButton!
    @IBOutlet weak var txtFldNameOfActivity: UITextField!
    @IBOutlet weak var txtFldWhichTypeOfTrip: UITextField!
    @IBOutlet weak var txtFldLocation: UITextField!
    @IBOutlet weak var txtViewDescription: UITextView!
    @IBOutlet weak var txtFldAdditionalInfo: UITextField!
    @IBOutlet weak var vWBgDescription: UIView!
    var imageArray = [UIImage]()
    
    let maxImageLimit = 10
    
    var selectedTextField: UITextField?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collActivityAdd.delegate = self
        collActivityAdd.dataSource = self
        
        collActivityAdd.register(UINib(nibName: "AddNewActivityCVCell", bundle: nil), forCellWithReuseIdentifier: "AddNewActivityCVCell")
        self.txtFldNameOfActivity.addPaddingToTextfield()
        self.txtFldWhichTypeOfTrip.addPaddingToTextfield()
        self.txtFldLocation.addPaddingToTextfield()
        self.txtFldAdditionalInfo.addPaddingToTextfield()
        self.txtFldNameOfActivity.delegate = self
        txtFldWhichTypeOfTrip.delegate = self
        txtFldAdditionalInfo.delegate = self
        txtFldLocation.delegate = self
        txtViewDescription.delegate = self
        
       
    }
    
    
    
    
    @IBAction func actionSave(_ sender: UIButton) {
        let vc = AddTripActivityOverlayVC()
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
       
        
    }
    
    @IBAction func actionNew(_ sender: UIButton) {
        sender.isSelected.toggle()
        btnExisting.isSelected = false
        
    }
    
    
    @IBAction func actionExisting(_ sender: UIButton) {
        sender.isSelected.toggle()
        btnNew.isSelected = false
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
    }
    
    
}





extension AddNewActivityVC: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                    if let error = error {
                        print("Error loading image: \(error.localizedDescription)")
                        return
                    }
                    
                    if let image = object as? UIImage {
                        self.imageArray.append(image)
                        
                        DispatchQueue.main.async {
                            self.collActivityAdd.reloadData()
                        }
                    }
                }
            }
        }
    }
}


extension AddNewActivityVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == imageArray.count && imageArray.count < maxImageLimit {
            var config = PHPickerConfiguration()
            config.selectionLimit = maxImageLimit - imageArray.count
            let phpicker = PHPickerViewController(configuration: config)
            phpicker.delegate = self
            self.present(phpicker, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(imageArray.count + 1, maxImageLimit)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddNewActivityCVCell", for: indexPath) as? AddNewActivityCVCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.item < imageArray.count {
            cell.imgAdd.contentMode = .scaleAspectFill
            cell.imgAdd.image = imageArray[indexPath.item]
            cell.btnDelete.isHidden = false
            cell.deleteButtonAction = { [weak self] in
                self?.deleteImage(at: indexPath)
            }
        } else {
            cell.imgAdd.contentMode = .scaleAspectFit
            cell.imgAdd.image = UIImage(named: "ic_addPhoto")
            cell.btnDelete.isHidden = true
        }
        
        
        
        return cell
    }
    
    func deleteImage(at indexPath: IndexPath) {
        guard indexPath.item < imageArray.count else {
            return
        }
        
       
        imageArray.remove(at: indexPath.item)
        
   
        collActivityAdd.performBatchUpdates({
            
            collActivityAdd.deleteItems(at: [indexPath])
        }) { [weak self] _ in
           
            self?.collActivityAdd.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 130)
    }
}

extension AddNewActivityVC : UITextFieldDelegate{
    
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


extension AddNewActivityVC : UITextViewDelegate{

    func textViewDidBeginEditing(_ textView: UITextView) {

        vWBgDescription.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
        vWBgDescription.layer.borderWidth = 1
    }
    func textViewDidEndEditing(_ textView: UITextView) {

        
        vWBgDescription.layer.borderWidth = 0.4
        vWBgDescription.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        
    }
    }

