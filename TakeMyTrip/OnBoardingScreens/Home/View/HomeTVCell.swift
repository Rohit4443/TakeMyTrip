//
//  HomeTVCell.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 10/08/23.
//

import UIKit

class HomeTVCell: UITableViewCell{
    //MARK: - IBOutlets -
    @IBOutlet weak var collSecond: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    weak var delegate: HomeTVCellDelegate?
    
    //MARK: - LifeCycleMethods -
    override func awakeFromNib() {
        super.awakeFromNib()
        collSecond.delegate = self
        collSecond.dataSource = self
        collSecond.register(UINib(nibName: "HomeSecondCVCell", bundle: nil), forCellWithReuseIdentifier: "HomeSecondCVCell")
        
        pageControl.hidesForSinglePage = true
        self.collSecond.isPagingEnabled = true
      
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
            let index = scrollView.contentOffset.x / witdh
            let roundedIndex = round(index)
            self.pageControl.currentPage = Int(roundedIndex)
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }
        
        func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
            pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
     
    }
    
    @objc func actionComment(sender: UIButton) {
           delegate?.homeTVCell(self, didTapCommentIn: sender.tag)
       }
    
    @objc func actionReport(sender: UIButton) {
        delegate?.homeTVCell(self, didTapReportIn: sender.tag)
       }
}



//MARK: - CollectionView Delegate and DataSource -
extension HomeTVCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSecondCVCell", for: indexPath)as! HomeSecondCVCell
        
        cell.btnComment.addTarget(self, action: #selector(actionComment), for: .touchUpInside)
        
        cell.btnReport.addTarget(self, action: #selector(actionReport), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,height: collectionView.frame.size.height)
    }
    
}

protocol HomeTVCellDelegate: AnyObject {
    func homeTVCell(_ cell: HomeTVCell, didTapCommentIn index: Int)
    func homeTVCell(_ cell: HomeTVCell, didTapReportIn index: Int)
}



