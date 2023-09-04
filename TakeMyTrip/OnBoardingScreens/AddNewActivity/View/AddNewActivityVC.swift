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
    
    var imageArray = [UIImage]()
    
    let maxImageLimit = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collActivityAdd.delegate = self
        collActivityAdd.dataSource = self
        
        collActivityAdd.register(UINib(nibName: "AddNewActivityCVCell", bundle: nil), forCellWithReuseIdentifier: "AddNewActivityCVCell")
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


extension AddNewActivityVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
           
            cell.imgAdd.image = imageArray[indexPath.item]
            cell.btnDelete.isHidden = false
            cell.deleteButtonAction = { [weak self] in
                self?.deleteImage(at: indexPath)
            }
        } else {
        
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
}
