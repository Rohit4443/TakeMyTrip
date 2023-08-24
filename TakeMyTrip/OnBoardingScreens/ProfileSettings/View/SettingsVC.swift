//
//  Settings.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 19/08/23.
//

import UIKit

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblSettingList: UITableView!
    var arraysettings = ["Blocked User","Set Profile as","Drafted Activites","Change Password","Privacy Policy","Term & Conditions","Invite Friends","Delete Account"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSettingList.delegate = self
        tblSettingList.dataSource = self
        tblSettingList.register(UINib(nibName: "SettingsTVCell",bundle: nil), forCellReuseIdentifier: "SettingsTVCell")
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        tabBarController?.tabBar.isHidden = false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraysettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTVCell", for: indexPath)as! SettingsTVCell
        cell.lbltext.text = arraysettings[indexPath.row]
        if indexPath.row == 1{
            cell.vWPubPriv.isUserInteractionEnabled = true
            cell.btnNext.isHidden = true
        }else{
            cell.vWPubPriv.isHidden = true
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.row {
        case 0:
            let vc = BlockedUserVC()
            self.navigationController?.pushViewController(vc, animated: true)
            tabBarController?.tabBar.isHidden = true
            break;
        case 1:
            
            break;
        case 2:
            let vc = DraftedActivitiesVC()
            self.navigationController?.pushViewController(vc, animated: true)
            tabBarController?.tabBar.isHidden = true
            break;
            
        case 3:
            let vc = ChangePasswordVC()
            self.navigationController?.pushViewController(vc, animated: true)
            tabBarController?.tabBar.isHidden = true
            break;
            
        case 4:
            
            break;
            
        case 5:
            
            break;
            
        case 6:
            let vc = InviteFriendsVC()
            self.navigationController?.pushViewController(vc, animated: true)
            tabBarController?.tabBar.isHidden = true
            break;
            
        case 7:
            
            break;
            
        case 8:
            
            break;
            
        default:
            break;
            
        }
        
    }
}

