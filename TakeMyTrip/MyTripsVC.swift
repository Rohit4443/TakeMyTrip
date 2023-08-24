//
//  MyTripsVC.swift
//  TakeMyTrip
//
//  Created by Vivek Dharmani on 09/08/23.
//

import UIKit

class MyTripsVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    // MARK: - IB Outlets -
    @IBOutlet weak var tblMyTrip: UITableView!
    @IBOutlet weak var BtnCompleted: UIButton!
    @IBOutlet weak var lblCompletedLIne: UILabel!
    @IBOutlet weak var BtnPlanned: UIButton!
    @IBOutlet weak var lblPlannedLine: UILabel!
    
    // MARK: - ViewdidLoad -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMyTrip.delegate = self
        tblMyTrip.dataSource = self
        tblMyTrip.register(UINib(nibName: "CompleteTripCell", bundle: nil), forCellReuseIdentifier: "CompleteTripCell")
        
        
        
    }
    
    
    @IBAction func actionCompleted(_ sender: UIButton) {
        lblCompletedLIne.backgroundColor = UIColor.init(r: 239, g: 90, b: 0, a: 1)
        lblPlannedLine.backgroundColor =  .clear
        BtnCompleted.setTitleColor(UIColor(r: 239, g: 90, b: 0, a: 1), for: .normal)
        
    }
    
    @IBAction func actionPlanned(_ sender: UIButton) {
        lblPlannedLine.backgroundColor = UIColor.init(r: 239, g: 90, b: 0, a: 1)
        lblCompletedLIne.backgroundColor = .clear
        
        
    }
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
