//
//  UserPostDetailShowTVCell.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 19/09/23.
//

import UIKit

protocol ShowPostDetailTVCellDelegate: AnyObject {
    func ShowPostDetailTVCell(_ cell: ShowPostDetailTVCell, didTapCommentIn index: Int)
    func ShowPostDetailTVCell(_ cell: ShowPostDetailTVCell, didTapMenuIn index: Int)

}
class ShowPostDetailTVCell: UITableViewCell {
    
    @IBOutlet weak var collShowDetail: UICollectionView!
    var arraypost = ["Rectangle 64","Rectangle 64","Rectangle 64","Rectangle 64",]
    
    @IBOutlet weak var pageControl: UIPageControl!
    weak var delegate: ShowPostDetailTVCellDelegate?
    var controller: UIViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        
                collShowDetail.delegate = self
                collShowDetail.dataSource = self
                collShowDetail.register(UINib(nibName: "ShowPostDetailCVCell", bundle: nil), forCellWithReuseIdentifier: "ShowPostDetailCVCell")
        
                pageControl.hidesForSinglePage = true
                self.collShowDetail.isPagingEnabled = true
        
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
        
                // Configure the view for the selected state
            }
    
    @objc func actionComment(sender: UIButton) {
           delegate?.ShowPostDetailTVCell(self, didTapCommentIn: sender.tag)
       }
    
    @objc func actionMenu(sender: UIButton) {
        delegate?.ShowPostDetailTVCell(self, didTapMenuIn: sender.tag)
        
       }
   
}

        
        
        

//MARK: - CollectionView Delegate and DataSource -
extension ShowPostDetailTVCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowPostDetailCVCell", for: indexPath)as! ShowPostDetailCVCell
        cell.imgPost.image = UIImage(named: arraypost[indexPath.row])
        cell.btnComment.tag = indexPath.row
        cell.btnComment.addTarget(self, action: #selector(actionComment), for: .touchUpInside)
        cell.btnMenu.tag = indexPath.row
        cell.btnMenu.addTarget(self, action: #selector(actionMenu), for: .touchUpInside)
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,height: collectionView.frame.size.height)
    }
    
    
    
}
