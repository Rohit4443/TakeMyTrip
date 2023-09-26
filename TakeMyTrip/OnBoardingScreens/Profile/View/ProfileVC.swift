//
//  ProfileVC.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 09/08/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    //MARK: - IBOutlets -
    @IBOutlet weak var collCompleteTrip: UICollectionView!
    @IBOutlet weak var btnFollowers: UIButton!
    @IBOutlet weak var btnFollowing: UIButton!
    @IBOutlet weak var btnEditProfile: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var lblProfile: UILabel!
    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnThreeDotOption: UIButton!
    @IBOutlet weak var btnCompleteTrip: UIButton!
    @IBOutlet weak var btnPlannedTrip: UIButton!
    //MARK: - Variables -
    var arrayImg = ["img1","img1","img1","img1","img1","img1","img1","img1","img1",]
    var comefrom : String?
    
    
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        collCompleteTrip.delegate = self
        collCompleteTrip.dataSource = self
        collCompleteTrip.frame = view.bounds
        
        collCompleteTrip.register(UINib(nibName: "CompleteTripCVCell", bundle: nil), forCellWithReuseIdentifier: "CompleteTripCVCell")
        
        collCompleteTrip.collectionViewLayout = ProfileVC.CreateLayout()
        self.navigationController?.isNavigationBarHidden = true
        btnPlannedTrip.tintColor = .systemGray
            
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if comefrom == "OtherProfile"{
            btnEditProfile.setTitle("Follow", for: .normal)
            btnShare.setTitle("Message", for: .normal)
            lblProfile.isHidden = true
            btnSettings.isHidden = true
        
        
        }else{
           
            btnBack.isHidden = true
            btnThreeDotOption.isHidden = true
        }
    }
    
    //MARK: - IBAction -
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
    
    @IBAction func actionCompleteTrip(_ sender: UIButton) {
        btnCompleteTrip.backgroundColor = UIColor.init(r: 239, g: 90, b: 0, a: 1)
        btnPlannedTrip.backgroundColor = .clear
        btnCompleteTrip.tintColor = .white
        btnPlannedTrip.tintColor = .systemGray
        
    }
    
    
    @IBAction func actionPlannedTrip(_ sender: UIButton) {
        btnPlannedTrip.backgroundColor = UIColor.init(r: 239, g: 90, b: 0, a: 1)
        btnCompleteTrip.backgroundColor = .clear
        btnCompleteTrip.tintColor = .systemGray
        btnPlannedTrip.tintColor = .white
    }

    
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
    }
    
    @IBAction func actionMessage(_ sender: UIButton) {
        if btnShare.title == "Message"{
            let vc = OneToOneChatVC()
            self.pushViewController(vc, true)
        
            
            
        }else{
            
        }
        
      
    }
    
    @IBAction func actionBlockReport(_ sender: UIButton) {
        if comefrom == "OtherProfile"{
            let vc = BlockReportPopUpVC()
           vc.modalPresentationStyle = .overFullScreen
            self.present(vc, true)
        }else{
            
        }
    }
    
}




//MARK: - CollectionView Delegate and DataSource -
extension ProfileVC:        UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompleteTripCVCell", for: indexPath)as! CompleteTripCVCell
        cell.imgCompletedTrips.image = UIImage(named: arrayImg[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let vc = ShowPostVC()
        vc.hidesBottomBarWhenPushed = true
        self.pushViewController(vc, true)



    }
    
    static func CreateLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2/3),
            heightDimension: .fractionalHeight(1)
        )
        
        let rightItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let rightItem = NSCollectionLayoutItem(layoutSize: rightItemSize)
        rightItem.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let rightGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: rightItem,
            count: 2
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            ),
            subitems: [item, rightGroup]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

