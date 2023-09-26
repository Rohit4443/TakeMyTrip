//
//  HomeTVCell.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 10/08/23.
//

import UIKit
protocol HomeTVCellDelegate: AnyObject {
    func homeTVCell(_ cell: HomeTVCell, didTapCommentIn index: Int)
    func homeTVCell(_ cell: HomeTVCell, didTapReportIn index: Int)
    func homeTVCell(_ cell: HomeTVCell, didTapBack index: Int)

}
class HomeTVCell: UITableViewCell{
    //MARK: - IBOutlets -
    @IBOutlet weak var collSecond: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var arraypost = ["Rectangle 64","ic_2","ic_3","ic_4","ic_5","ic_6","ic_7","ic_8","ic_9","ic_10","ic_11","ic_12","ic_13","ic_14","ic_15","ic_16","ic_17",]
    weak var delegate: HomeTVCellDelegate?
    var controller: UIViewController?
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
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//
//    }
    
    @objc func actionComment(sender: UIButton) {
           delegate?.homeTVCell(self, didTapCommentIn: sender.tag)
       }
    
    @objc func actionReport(sender: UIButton) {
        delegate?.homeTVCell(self, didTapReportIn: sender.tag)
        
       }
    @objc func actionBack(sender: UIButton) {
      //  delegate?.homeTVCell(self, didTapBack: sender.tag)
        
       }
}



//MARK: - CollectionView Delegate and DataSource -
extension HomeTVCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSecondCVCell", for: indexPath)as! HomeSecondCVCell
        cell.imgHomePost.image = UIImage(named: arraypost[indexPath.row])
        cell.btnComment.tag = indexPath.row
        cell.btnComment.addTarget(self, action: #selector(actionComment), for: .touchUpInside)
        cell.btnReport.tag = indexPath.row
        cell.btnReport.addTarget(self, action: #selector(actionReport), for: .touchUpInside)
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = HomePostDetailVC()
        vc.hidesBottomBarWhenPushed = true
        controller?.pushViewController(vc, true)
        
        
    }
    
}





