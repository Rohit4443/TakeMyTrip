//
//  HomeVc.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 09/08/23.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - IBOutlets -
    @IBOutlet weak var tblHome: UITableView!
    @IBOutlet weak var collFirstHorizontal: UICollectionView!
    
    
    //MARK: - Variables -
    var arraayFirstHorizontal = ["Adventurous","Extreme Activity","Beach Bum","Mountains"]
    let image = UIImage(named: "imgarrow")
    
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        collFirstHorizontal.delegate = self
        collFirstHorizontal.dataSource = self
        tblHome.delegate = self
        tblHome.dataSource = self
        
        collFirstHorizontal.register(UINib(nibName: "HomeFirstCVCell", bundle: nil), forCellWithReuseIdentifier: "HomeFirstCVCell")
        tblHome.register(UINib(nibName: "HomeTVCell", bundle: nil), forCellReuseIdentifier: "HomeTVCell")
    }
    
    
    
    
    //MARK: - IBAction -
    @IBAction func actionSearch(_ sender: UIButton) {
        let vc = SearchUsersVC()
        self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func actionNotifiction(_ sender: UIButton) {
        let vc = NotificationVC()
        self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    @IBAction func actionFilter(_ sender: UIButton) {
        let vc = FilterVC()
        self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
}



//MARK: - CollectionView Delegate and DataSource -
extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraayFirstHorizontal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFirstCVCell", for: indexPath) as! HomeFirstCVCell
        cell.lblFirst.text = arraayFirstHorizontal[indexPath.row]
        cell.imgfirst.image = UIImage(named: "imgarrow")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3.5, height: 32)
        return CGSize(width: arraayFirstHorizontal[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11)]).width + 10, height: 32)
        
    }
}




//MARK: - TableView Delegate and DataSource -
extension HomeVC: UITableViewDelegate,UITableViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVCell", for: indexPath)as! HomeTVCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

