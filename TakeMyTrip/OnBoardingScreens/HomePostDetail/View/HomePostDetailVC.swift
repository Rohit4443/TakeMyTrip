//
//  HomePostDetailVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 06/09/23.
//

import UIKit

class HomePostDetailVC: UIViewController {

    @IBOutlet weak var collPostDetail: UICollectionView!
    
    @IBOutlet weak var PageControl: UIPageControl!
    
    var controller:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collPostDetail.delegate = self
        collPostDetail.dataSource = self
        collPostDetail.register(UINib(nibName: "HomeSecondCVCell", bundle: nil), forCellWithReuseIdentifier: "HomeSecondCVCell")
        
        PageControl.hidesForSinglePage = true
        self.collPostDetail.isPagingEnabled = true
        
      
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
    
    
    @IBAction func actionAddtoDraft(_ sender: UIButton) {
        let vc = DraftedActivitiesVC()
        self.pushViewController(vc, true)
    }
    
    }


   



//MARK: - CollectionView Delegate and DataSource -
extension HomePostDetailVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSecondCVCell", for: indexPath)as! HomeSecondCVCell
        cell.btnBackHide.isHidden = false
        cell.btnUpArrow.isHidden = false
        cell.btnBackHide.tag = indexPath.row
        cell.btnBackHide.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,height: collectionView.frame.size.height)
    }
    
    @objc func actionBack(sender:UIButton){
        popVC()
    }
    
}
extension HomePostDetailVC : HomeTVCellDelegate{
    func homeTVCell(_ cell: HomeTVCell, didTapCommentIn index: Int) {
        
    }
    
    func homeTVCell(_ cell: HomeTVCell, didTapReportIn index: Int) {
        let vc = ReportVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func homeTVCell(_ cell: HomeTVCell, didTapBack index: Int) {
        popVC()
    }
    
    
}
