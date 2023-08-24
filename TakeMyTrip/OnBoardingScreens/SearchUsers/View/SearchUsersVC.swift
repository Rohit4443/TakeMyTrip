//
//  SearchNamesVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 22/08/23.
//

import UIKit

class SearchUsersVC: UIViewController{
    
    
    //MARK: - IBOutlets -
    @IBOutlet weak var tblUserList: UITableView!
    @IBOutlet weak var txtFldSearch: UITextField!
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblUserList.delegate = self
        tblUserList.dataSource = self
        txtFldSearch.addPaddingToPasswordTextField()
        
        tblUserList.register(UINib(nibName: "UserTVC",bundle: nil), forCellReuseIdentifier: "UserTVC")
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = false
    }
    
}

//MARK: - TableView Delegate and DataSource -
extension SearchUsersVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTVC", for: indexPath)as! UserTVC
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

