//
//  Settings.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 19/08/23.
//

import UIKit

class SettingsVC: UIViewController{
    
    
    //MARK: - IBOutlets -
    @IBOutlet weak var tblSettingList: UITableView!
    
    
    //MARK: - Variables -
    var arraysettings = ["Blocked User","Set Profile as","Drafted Activites","Change Password","Privacy Policy","Terms & Conditions","Invite Friends","Delete Account","Logout"]
    var arrayimg = ["ic_blockImg","ic_setProfile","ic_DraftedActivity","ic_changePasswrd","ic_privacyPolicy","ic_term&condition","ic_inviteFriends","ic_deleteAccount","ic_logout",]
    
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSettingList.delegate = self
        tblSettingList.dataSource = self
        
        tblSettingList.register(UINib(nibName: "SettingsTVCell",bundle: nil), forCellReuseIdentifier: "SettingsTVCell")
        tabBarController?.tabBar.isHidden = true
    }
    
    
    
    //MARK: - IBAction -
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
        tabBarController?.tabBar.isHidden = false
    }
    
}




//MARK: - TableView Delegate and DataSource -
extension  SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraysettings.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTVCell", for: indexPath)as! SettingsTVCell
        cell.imgImage.image = UIImage(named: arrayimg[indexPath.row])
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

