//
//  FollowingVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 18/08/23.
//

import UIKit

class FollowingVC: UIViewController{
    
    
    //MARK: - IBOutlets -
    @IBOutlet weak var tblFollowingList: UITableView!
    
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFollowingList.delegate = self
        tblFollowingList.dataSource = self
        tblFollowingList.register(UINib(nibName: "FollowingtListTVCell",bundle: nil), forCellReuseIdentifier: "FollowingtListTVCell")
    }
    
    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}



//MARK: - TableView Delegate and DataSource -
extension FollowingVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingtListTVCell", for: indexPath)as! FollowingtListTVCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
