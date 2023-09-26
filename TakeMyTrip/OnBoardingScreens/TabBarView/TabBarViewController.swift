//
//  TabBarViewController.swift
//  TakeMyTrip
//
//  Created by Dr.mac on 20/09/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    var attributesForTitle: [NSAttributedString.Key : Any] {
        return [NSAttributedString.Key.font: UIFont.setCustom(.Poppins_Medium, 12)]
        //UIFont.systemFont(ofSize: 10)
    }
    var currentController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNotificationAbsorver()
        self.setTabController()
        tabBar.cornerRadius = 20
        tabBar.shadowRadius = 3
        tabBar.layer.shadowOpacity = 0.5
        tabBar.shadowColor = .systemGray5
        tabBar.frame.size.height = 100
        tabBar.frame.origin.y = view.frame.size.height - 45
        tabBar.backgroundColor = .white
    }
    
    
    
    func setNotificationAbsorver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.editPostAction(_:)), name: Notification.Name("Profile"), object: nil)
    }
    
    @objc func editPostAction(_ notification: Notification) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            self.selectedIndex = 4
        }
    }
    
    @objc func clickOnImageAction(_ notification: Notification) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            self.selectedIndex = 0
        }
    }
    
    
    func setTabController() {
        //        self.tabBar.backgroundColor = .white
        //        self.tabBar.shadowColor = .init(white: 00000, alpha: 0.12)
        //        self.tabBar.shadowOffset = CGSize(width: 0, height: 1)
        //        self.tabBar.shadowOpacity = 0.8
        //
        //        self.tabBar.tintColor = UIColor(hexString: "#207FFA")
        
        
        
        
        let controller1 = HomeVC()
        let controller2 = MyTripsVC()
        let controller3 = CreateTripViewController()
        controller3.view.backgroundColor = .white
        let controller4 = ChatListVC()
        let controller5 = ProfileVC()
        
        
        
        controller1.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_Home")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_selectedHome")?.withRenderingMode(.alwaysOriginal))
        
        controller2.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_MyTrip")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_selectedMyTrip")?.withRenderingMode(.alwaysOriginal))
        
        controller3.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_CreateTrip")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_selectedCreateTrip")?.withRenderingMode(.alwaysOriginal))
        
        
        controller4.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_message")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_selectedmessage")?.withRenderingMode(.alwaysOriginal))
        
        controller5.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_profile")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_selectedprofile")?.withRenderingMode(.alwaysOriginal))
        
        
        
        let v1 =  UINavigationController(rootViewController: controller1)
        v1.navigationBar.isHidden = true
        
        let v2 =  UINavigationController(rootViewController: controller2)
        v2.navigationBar.isHidden = true
        
        let v3 =  UINavigationController(rootViewController: controller3)
        v3.navigationBar.isHidden = true
        
        let v4 =  UINavigationController(rootViewController: controller4)
        v3.navigationBar.isHidden = true
        
        let v5 =  UINavigationController(rootViewController: controller5)
        v3.navigationBar.isHidden = true
        
        self.viewControllers = [v1, v2, v3, v4, v5]
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //  tabBar.frame.size.height = 65
        // tabBar.frame.origin.y = view.frame.size.height - 65
       // self.tabBar.isTranslucent = false
        view.backgroundColor = .white
        let itemWidth = tabBar.frame.width / CGFloat(tabBar.items?.count ?? 1)
        let horizontalInset = (tabBar.frame.width - itemWidth) / 5
        
        tabBar.items?.forEach { item in
            item.imageInsets = UIEdgeInsets(top: 10, left: horizontalInset, bottom: -10, right: horizontalInset)
        }
    }
}
