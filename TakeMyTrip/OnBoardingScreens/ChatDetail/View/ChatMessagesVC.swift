//
//  ChatMessagesVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 17/08/23.
//

import UIKit

class ChatMessagesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var vWTopBackground: UIView!
    @IBOutlet weak var tblChat: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblChat.delegate = self
        tblChat.dataSource = self
        tblChat.register(UINib(nibName: "LeftTVCell", bundle: nil), forCellReuseIdentifier: "LeftTVCell")
        tblChat.register(UINib(nibName: "RightTVCell",bundle: nil), forCellReuseIdentifier: "RightTVCell")
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        self.vWTopBackground.shadowRadius = 4
        self.vWTopBackground.shadowOpacity = 0.5
        self.vWTopBackground.shadowOffset = CGSize(width: 0, height: 0)
        self.vWTopBackground.shadowColor = .gray
    }
    
    
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeftTVCell", for: indexPath)
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RightTVCell", for: indexPath)
            
            return cell
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
