//
//  ProfileVC.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 09/08/23.
//

import UIKit

class ProfileVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collCompleteTrip: UICollectionView!
    var arrayImg = ["img1","img1","img1","img1","img1","img1","img1"]
    
    @IBOutlet weak var btnFollowers: UIButton!
    @IBOutlet weak var btnFollowing: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        collCompleteTrip.delegate = self
        collCompleteTrip.dataSource = self
        collCompleteTrip.frame = view.bounds
        collCompleteTrip.register(UINib(nibName: "CompleteTripCVCell", bundle: nil), forCellWithReuseIdentifier: "CompleteTripCVCell")
        collCompleteTrip.collectionViewLayout = ProfileVC.CreateLayout()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func actionSetting(_ sender: UIButton) {
        let vc = SettingsVC()
        self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func actionFollower(_ sender: UIButton) {
        let vc = FollowerListVC()
        self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
        
    }
    @IBAction func actionFollowing(_ sender: UIButton) {
        let vc = FollowingVC()
        self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    @IBAction func actionEditProfile(_ sender: Any) {
        let vc = EditProfileVC()
        self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompleteTripCVCell", for: indexPath)as! CompleteTripCVCell
        cell.imgCompletedTrips.image = UIImage(named: arrayImg[indexPath.row])
        return cell
    }
    
    
    static func CreateLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        
        let verticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2),
                heightDimension: .fractionalHeight(1)
            )
        )
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        let VerticalStckGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: verticalStackItem,
            count: 2
        )
        
        let Group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)),
            subitems: [
                item,
                VerticalStckGroup
            ]
        )
        
        
        
        // section
        let section = NSCollectionLayoutSection(group: Group)
        
        // return
        return UICollectionViewCompositionalLayout(section: section)
        
        
    }
}
