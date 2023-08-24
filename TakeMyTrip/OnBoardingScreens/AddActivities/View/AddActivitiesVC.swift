//
//  AddActivitiesVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 23/08/23.
//

import UIKit

class AddActivitiesVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tblActivitiesList: UITableView!
    
    var arrayAddList = ["World Tour Day 1","Mountain calling Day 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblActivitiesList.delegate = self
        tblActivitiesList.dataSource = self
        tblActivitiesList.register(UINib(nibName: "ActivitiesListTVC"), forCellReuseIdentifier: "ActivitiesListTVC")
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitiesListTVC", for: indexPath)as! ActivitiesListTVC
        cell.lblActivityName.text = arrayAddList[indexPath.row]
        cell.btnAddActivity.addTarget(self, action: #selector(actionOpenPopUp), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    @objc func actionOpenPopUp(){
        let vc = EditDeletePopUpActivitiesVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, true)
        
    }
    
}

