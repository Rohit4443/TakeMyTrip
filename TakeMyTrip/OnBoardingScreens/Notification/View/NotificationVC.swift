//
//  NotificationVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 22/08/23.
//

import UIKit

class NotificationVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tblNotification: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblNotification.delegate = self
        tblNotification.dataSource = self
        tblNotification.register(UINib(nibName: "NotifyTVCell"), forCellReuseIdentifier: "NotifyTVCell")
        self.navigationController?.isNavigationBarHidden = true
        
    }
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifyTVCell", for: indexPath) as! NotifyTVCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

