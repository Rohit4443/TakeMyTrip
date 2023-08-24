//
//  DraftedActivitiesVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 21/08/23.
//

import UIKit

class DraftedActivitiesVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblActivities: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblActivities.delegate = self
        tblActivities.dataSource = self
        tblActivities.register(UINib(nibName: "CompleteTripCell", bundle: nil), forCellReuseIdentifier: "CompleteTripCell")
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = true
    }
    
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


