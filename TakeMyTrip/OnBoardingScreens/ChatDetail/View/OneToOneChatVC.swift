//
//  OneToOneChatVC.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 13/09/23.
//

import UIKit
import IQKeyboardManager


class OneToOneChatVC: UIViewController {
   
    

    //MARK: - IBOutlets -
    @IBOutlet weak var vWTopBg: UIView!
    @IBOutlet weak var tblChat: UITableView!
    @IBOutlet weak var vWBG: UIView!
    @IBOutlet weak var txtvWTypedMesssaage: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    //MARK: - Variables -
    var keyboard: KeyboardVM?
    var selectedTextField: UITextField?
    
    
    //MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblChat.delegate = self
        tblChat.dataSource = self

      
        tblChat.register(UINib(nibName: "LeftTVCell", bundle: nil), forCellReuseIdentifier: "LeftTVCell")
        
        tblChat.register(UINib(nibName: "RightTVCell",bundle: nil), forCellReuseIdentifier: "RightTVCell")
//       self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        
        vWTopBg.layer.masksToBounds = false
        vWTopBg.layer.shadowColor = UIColor.init(r: 0, g: 0, b: 0, a: 0.12).cgColor
        vWTopBg.layer.shadowOpacity = 0.5
        vWTopBg.layer.shadowOffset = CGSize(width: 0, height: 8)
        vWTopBg.layer.shadowRadius = 8
        vWTopBg.layer.cornerRadius = 22
        
        
        let topBorder = CALayer()
                topBorder.frame = CGRect(x: 0, y: 0, width: vWTopBg.frame.size.width, height: 0) // Adjust the height as needed
                topBorder.backgroundColor = UIColor.clear.cgColor
                vWTopBg.layer.addSublayer(topBorder)
    }
       
    
    override func viewWillAppear(_ animated: Bool) {
        keyboard = KeyboardVM()
        IQKeyboardManager.shared().isEnabled = false
                keyboard?.setKeyboardNotification(self)

        tblChat.scrollToBottom
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
            keyboard?.removeKeyboardNotification()
        IQKeyboardManager.shared().isEnabled = true
        }
    
    
    //MARK: - IBAction -
   
    @IBAction func actionBack(_ sender: UIButton) {
        popVC()
    }
    
}


//MARK: - TableView Delegate and DataSource -
extension OneToOneChatVC: UITableViewDelegate, UITableViewDataSource{
    
    
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
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
}

extension OneToOneChatVC : UITextViewDelegate{

    func textViewDidBeginEditing(_ textView: UITextView) {

        vWBG.layer.borderColor = UIColor.init(r: 239, g: 90, b: 0, a: 1).cgColor
        vWBG.layer.borderWidth = 1
    }
    func textViewDidEndEditing(_ textView: UITextView) {

        
        vWBG.layer.borderWidth = 0.4
        vWBG.layer.borderColor = UIColor.init(r: 195, g: 195, b: 195, a: 1).cgColor
        
    }
    }




//    MARK: - KEYBOARD OBSERVER
extension OneToOneChatVC: KeyboardVMObserver {
    
    func keyboard(didChange height: CGFloat, duration: Double, animation: UIView.AnimationOptions) {
        if txtvWTypedMesssaage.isFirstResponder {
            if bottomConstraint.constant == height {
                return
            }
        } else {
            if bottomConstraint.constant == 0 {
                return
            }
        }
        print("height is \(height)")
        self.bottomConstraint.constant = height
        self.view.setNeedsUpdateConstraints()
        UIView.animate(withDuration: duration, delay: 0.0, options: animation, animations: { () -> Void in
            self.view.layoutIfNeeded()
        }, completion: { finished in
            //self.scrollToBottom(isScrolled: false)
        })
    }
    //    MARK: - SCROLL TO BOTTOM
//           func scrollToBottom(isScrolled:Bool) {
//               guard isTableScrolled() == false || isScrolled == true  else { return }
//               guard let count = self.viewModel?.chatHistory.count,
//                     count > 0  else { return }
//               let section = 0
//               DispatchQueue.main.asyncAfter(deadline: .now()+0.15) {
//                   let indexPath = IndexPath(row: count - 1, section: section)
//                   self.chatdetailsTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
//               }
//           }
//
//       func isTableScrolled() -> Bool {
//           return (self.tblChat.contentOffset.y < (self.tblChat.contentSize.height - SCREEN_SIZE.height))
//       }
       
    
}
