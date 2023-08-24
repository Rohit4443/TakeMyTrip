//
//  BlockedUserVC.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 19/08/23.
//

import UIKit

class BlockedUserVC: UIViewController{
    
    
    //MARK: - IBOutlets -
    @IBOutlet weak var tblBlockList: UITableView!
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblBlockList.delegate = self
        tblBlockList.dataSource = self
        self.navigationController?.isNavigationBarHidden = true
        tblBlockList.register(UINib(nibName: "FollowingtListTVCell",bundle: nil), forCellReuseIdentifier: "FollowingtListTVCell")
    }
    
    
    
    //MARK: - IBAction -
    @IBAction func btnBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
}



//MARK: - TableView Delegate and DataSource -
extension BlockedUserVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingtListTVCell", for: indexPath)as! FollowingtListTVCell
        cell.btnUnfollow.backgroundColor = UIColor.init(r: 208, g: 82, b: 24, a: 1)
        cell.btnUnfollow.setTitleColor(UIColor.white, for: .normal)
        cell.btnUnfollow.setTitle("unblock", for: .normal)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
