//
//  MyTripsVC.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 09/08/23.
//

import UIKit

class MyTripsVC: UIViewController{
    // MARK: - IB Outlets -
    @IBOutlet weak var tblMyTrip: UITableView!
    @IBOutlet weak var BtnCompleted: UIButton!
    @IBOutlet weak var lblCompletedLIne: UILabel!
    @IBOutlet weak var BtnPlanned: UIButton!
    @IBOutlet weak var lblPlannedLine: UILabel!
    
    @IBOutlet weak var heightConsCompletedLineLbl: NSLayoutConstraint!
    
    @IBOutlet weak var heightConsPlannedLineLbl: NSLayoutConstraint!
    // MARK: - LifeCycleMethods -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMyTrip.delegate = self
        tblMyTrip.dataSource = self
        tblMyTrip.register(UINib(nibName: "CompleteTripCell", bundle: nil), forCellReuseIdentifier: "CompleteTripCell")
        
        lblCompletedLIne.backgroundColor = UIColor.init(r: 239, g: 90, b: 0, a: 1)
        lblPlannedLine.backgroundColor =  .lightGray
        BtnCompleted.setTitleColor(UIColor.black, for: .normal)
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        BtnCompleted.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 15)
       // BtnCompleted.titleLabel?.textColor = .black
        BtnPlanned.setTitleColor(UIColor.init(r: 0, g: 0, b: 0, a: 0.75), for: .normal)
        BtnCompleted.setTitleColor(UIColor.black, for: .normal)
        heightConsCompletedLineLbl.constant = 2
        lblCompletedLIne.backgroundColor = UIColor.init(r: 239, g: 90, b: 0, a: 1)
        BtnPlanned.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 15)
        heightConsPlannedLineLbl.constant = 1
        lblPlannedLine.backgroundColor =  .lightGray
    }
    // MARK: - IB Actions -
    @IBAction func actionCompleted(_ sender: UIButton) {
        
        lblCompletedLIne.backgroundColor = UIColor.init(r: 239, g: 90, b: 0, a: 1)
        BtnCompleted.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 15)
        heightConsCompletedLineLbl.constant = 2
        heightConsPlannedLineLbl.constant = 1
        lblPlannedLine.backgroundColor =  .lightGray
        BtnCompleted.setTitleColor(UIColor.black, for: .normal)
        BtnPlanned.setTitleColor(UIColor.init(r: 0, g: 0, b: 0, a: 0.75), for: .normal)
    }
    
    @IBAction func actionPlanned(_ sender: UIButton) {
        lblPlannedLine.backgroundColor = UIColor.init(r: 239, g: 90, b: 0, a: 1)
        BtnPlanned.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 15)
        heightConsPlannedLineLbl.constant = 2
        heightConsCompletedLineLbl.constant = 1
        lblCompletedLIne.backgroundColor = .lightGray
        BtnPlanned.setTitleColor(UIColor.black, for: .normal)
        BtnCompleted.setTitleColor(UIColor.init(r: 0, g: 0, b: 0, a: 0.75), for: .normal)
    }
    
}


// MARK: - UITableView Delegate and DataSource -
extension MyTripsVC:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompleteTripCell", for: indexPath)as! CompleteTripCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
}
