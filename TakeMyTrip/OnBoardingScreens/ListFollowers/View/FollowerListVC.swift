//
//  FollowerListVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 18/08/23.
//

import UIKit

class FollowerListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblFollowersList: UITableView!
    var arrayImg = ["img1","img2","img3","img4","img1","img2","img3","img4","img1","img3",]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFollowersList.delegate = self
        tblFollowersList.dataSource = self
        tblFollowersList.register(UINib(nibName: "FollowingtListTVCell",bundle: nil), forCellReuseIdentifier: "FollowingtListTVCell")
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingtListTVCell", for: indexPath)as! FollowingtListTVCell
        cell.btnUnfollow.backgroundColor = UIColor.init(r: 208, g: 82, b: 24, a: 1)
        cell.btnUnfollow.setTitleColor(UIColor.white, for: .normal)
        cell.btnUnfollow.setTitle("Follow", for: .normal)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
