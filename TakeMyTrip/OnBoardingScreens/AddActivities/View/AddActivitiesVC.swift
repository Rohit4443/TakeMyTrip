//
//  AddActivitiesVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 23/08/23.
//

import UIKit


class AddActivitiesVC: UIViewController {
    
    //MARK: - IBOutlets -
    @IBOutlet weak var tblActivitiesList: UITableView!
    
    
    //MARK: - Variables -
    var arrayAddList = ["World Tour Day 1","Mountain calling Day 2"]
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblActivitiesList.delegate = self
        tblActivitiesList.dataSource = self
        tblActivitiesList.register(UINib(nibName: "ActivitiesListTVC"), forCellReuseIdentifier: "ActivitiesListTVC")
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - IBAction -
    
    @IBAction func actionAddActivity(_ sender: UIButton) {
        let vc = AddNewActivityVC()
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    
}


//MARK: - TableView Delegate and DataSource -
extension  AddActivitiesVC: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAddList.count
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [self] in
                       
                        self.navigationController?.tabBarController?.selectedIndex = 2
                       
                    })
    }
    
    @objc func actionOpenPopUp(){
        let vc = EditDeletePopUpActivitiesVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, true)
        
    }
}
