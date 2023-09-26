//
//  HomeVc.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 09/08/23.
//

import UIKit

class HomeVC: UIViewController{
    
    
    
    //MARK: - IBOutlets -
    @IBOutlet weak var tblHome: UITableView!
    
    @IBOutlet weak var collFirstHorizontal: UICollectionView!
    
    @IBOutlet weak var btnFollowing: UIButton!
    
    @IBOutlet weak var btnExplore: UIButton!
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
    
    @IBAction func actionFollowing(_ sender: UIButton) {
        btnFollowing.backgroundColor = UIColor.init(r: 239, g: 90, b: 0, a: 1)
        btnExplore.backgroundColor = .clear
        btnFollowing.tintColor = .white
        btnExplore.tintColor = .systemGray
        
    }
    
    
    @IBAction func actionExplore(_ sender: UIButton) {
        btnExplore.backgroundColor = UIColor.init(r: 239, g: 90, b: 0, a: 1)
        btnFollowing.backgroundColor = .clear
        btnFollowing.tintColor = .systemGray
        btnExplore.tintColor = .white
    }
}



//MARK: - CollectionView Delegate and DataSource -
extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraayFirstHorizontal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFirstCVCell", for: indexPath) as! HomeFirstCVCell
        
        cell.lblFirst.text = arraayFirstHorizontal[indexPath.row]
        cell.imgfirst.image = UIImage(named: "imgarrow")
        //
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // You should replace "HomeFirstCVCell" with your custom UICollectionViewCell class
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFirstCVCell", for: indexPath) as! HomeFirstCVCell

        // Configure the cell with the data it will display (if needed)
        cell.lblFirst.text = arraayFirstHorizontal[indexPath.item]

        // Ensure the cell's layout constraints are set up properly
        cell.setNeedsLayout()
        cell.layoutIfNeeded()

        // Calculate the cell's size based on its content
        let size = cell.contentView.systemLayoutSizeFitting(
            CGSize(width: collectionView.bounds.width, height: 1)
        )

        // Set a fixed height and add a 5-point gap between cells
        let fixedHeight: CGFloat = 40.0
        let spacing: CGFloat = -2
        let finalSize = CGSize(width: size.width, height: fixedHeight + spacing)

        return finalSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return -2// Set the gap between cells to 5 points
    }


}


//MARK: - TableView Delegate and DataSource -
extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVCell", for: indexPath)as! HomeTVCell
        cell.controller = self
        cell.delegate = self
        return cell
    }
    
   
    
    

    
      
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let vc = HomePostDetailVC()
//        
//        self.navigationController?.pushViewController(vc, animated: true)
//        self.tabBarController?.tabBar.isHidden = true
    }
}

extension HomeVC : HomeTVCellDelegate{
    func homeTVCell(_ cell: HomeTVCell, didTapCommentIn index: Int) {
        let vc = CommentsVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func homeTVCell(_ cell: HomeTVCell, didTapReportIn index: Int) {
        let vc = ReportVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func homeTVCell(_ cell: HomeTVCell, didTapBack index: Int) {
        
    }
    
    
}
