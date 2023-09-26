//
//  AddTripActivityOverlayVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 31/08/23.
//

import UIKit

class AddTripActivityOverlayVC: UIViewController{
    @IBOutlet weak var collTripActivity: UICollectionView!
    
    @IBOutlet weak var PageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        collTripActivity.delegate = self
        collTripActivity.dataSource = self
        collTripActivity.register(UINib(nibName: "TripActivityOverlayCVCell", bundle: nil), forCellWithReuseIdentifier: "TripActivityOverlayCVCell")
        self.navigationController?.navigationBar.isHidden = true
        
        PageControl.hidesForSinglePage = true
        self.collTripActivity.isPagingEnabled = true
      
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
            let index = scrollView.contentOffset.x / witdh
            let roundedIndex = round(index)
            self.PageControl.currentPage = Int(roundedIndex)
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            PageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }
        
        func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
            PageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        
        
    
    }
    
    
    @IBAction func actionAdd(_ sender: UIButton) {
        let vc = CreateTripViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        
        
    
    }
    

}

extension AddTripActivityOverlayVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, TripActivityOverlayCVCellDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TripActivityOverlayCVCell", for: indexPath)as! TripActivityOverlayCVCell
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,height: collectionView.frame.size.height)
    }
    
    func didPressBackButton() {
         popVC()
      }
}
