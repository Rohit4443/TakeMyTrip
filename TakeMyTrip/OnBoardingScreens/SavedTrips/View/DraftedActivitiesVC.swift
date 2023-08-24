//
//  DraftedActivitiesVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 21/08/23.
//

import UIKit

class DraftedActivitiesVC: UIViewController{
    
    //MARK: - IBOutlets -
    @IBOutlet weak var tblActivities: UITableView!
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblActivities.delegate = self
        tblActivities.dataSource = self
        
        tblActivities.register(UINib(nibName: "CompleteTripCell", bundle: nil), forCellReuseIdentifier: "CompleteTripCell")
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
}



//MARK: - TableView Delegate and DataSource -
extension  DraftedActivitiesVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompleteTripCell", for: indexPath)as! CompleteTripCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
}
