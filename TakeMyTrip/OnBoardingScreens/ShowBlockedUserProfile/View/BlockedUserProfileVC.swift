//
//  BlockedUserProfileVC.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 20/08/23.
//

import UIKit

class BlockedUserProfileVC: UIViewController {
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    
    //MARK: - IBAction -
    @IBAction func btnBack(_ sender: UIButton) {
        popVC()
        self.tabBarController?.tabBar.isHidden = true
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
