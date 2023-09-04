//
//  AddTripActivityOverlayVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 31/08/23.
//

import UIKit

class AddTripActivityOverlayVC: UIViewController {
    @IBOutlet weak var collTripActivity: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collTripActivity.delegate = self
        collTripActivity.dataSource = self
        collTripActivity.register(UINib(nibName: "TripActivityOverlayCVCell", bundle: nil), forCellWithReuseIdentifier: "TripActivityOverlayCVCell")
        self.navigationController?.navigationBar.isHidden = true
    }

}

extension AddTripActivityOverlayVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TripActivityOverlayCVCell", for: indexPath)as! TripActivityOverlayCVCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,height: collectionView.frame.size.height)
    }
    
}
