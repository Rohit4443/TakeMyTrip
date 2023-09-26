//
//  UserPostVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 07/09/23.
//

import UIKit

class ShowPostVC: UIViewController {

    @IBOutlet weak var tblShowPost: UITableView!
    var comefrom : UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        tblShowPost.delegate = self
        tblShowPost.dataSource = self
        tblShowPost.register(UINib(nibName: "ShowPostDetailTVCell", bundle: nil), forCellReuseIdentifier: "ShowPostDetailTVCell")
    }

    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
    }
    

}
extension ShowPostVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowPostDetailTVCell", for: indexPath) as! ShowPostDetailTVCell
        cell.delegate = self
        cell.controller = self
        return cell
    }
    
   
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let vc = HomePostDetailVC()
//
//        self.navigationController?.pushViewController(vc, animated: true)
//        self.tabBarController?.tabBar.isHidden = true
    }
}

extension ShowPostVC : ShowPostDetailTVCellDelegate{
    func ShowPostDetailTVCell(_ cell: ShowPostDetailTVCell, didTapCommentIn index: Int) {
        let vc = CommentsVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func ShowPostDetailTVCell(_ cell: ShowPostDetailTVCell, didTapMenuIn index: Int) {
        let vc = EditDeletePostPopUpVC()
        vc.controller = self
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    

    
}


