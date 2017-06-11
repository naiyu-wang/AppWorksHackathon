//
//  MyActivityViewCOntroller.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/10.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import UIKit

class MyActivityTabelViewCell: UITableViewCell {
    
    @IBOutlet weak var tagImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var thLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var topVIew: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var bigView: UIView!
}

class MyActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addEventButton: UIButton!
    
    var button: Int = 0
    let eventManager = EventManager.shared
    let userManager = UserManager.shared
    var activities: [[String : Any]] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MyActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.title = Constants.appName
        self.addEventButton.layer.cornerRadius = 8        
        self.activities = self.userManager.activities
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "DEMO", style: .plain, target: self, action: #selector(triggerNotification))
        
//        if let user = UserManager.shared.user {
        
//        self.eventManager.getMyActivity(id: user.id, success: { value in
//            
//            self.activities = value
//            self.tableView.reloadData()
//            
//        }, failed: {
//        
//            //Annoying pop up card//
//        })
//    }
}
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        self.activities = self.userManager.activities
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MyActivityTabelViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyActivityTabelViewCell
        
        cell.topVIew.layer.cornerRadius = cell.topVIew.bounds.width / 2
        cell.timeView.layer.cornerRadius = 8
        cell.bigView.layer.cornerRadius = 10
        cell.titleLabel.text = self.activities[indexPath.row]["title"] as? String ?? "----"
        cell.locationLabel.text = self.activities[indexPath.row]["actPlace"] as? String ?? "----"
        cell.descriptionLabel.text = self.activities[indexPath.row]["description"] as? String ?? "----"
        cell.dateLabel.text = self.activities[indexPath.row]["actDate"] as? String ?? "--"
        cell.thLabel.text = self.activities[indexPath.row]["actTh"] as? String ?? "th"
        cell.monthLabel.text = self.activities[indexPath.row]["actMonth"] as? String ?? "May, Monday"
        cell.timeLabel.text = self.activities[indexPath.row]["actTime"] as? String ?? "09:10 AM"
        
        switch self.activities[indexPath.row]["type"] as? String ?? "----" {
            
            case "movie":
                cell.tagImage.image = UIImage(named: "movie")
            
            case "food":
                cell.tagImage.image = UIImage(named: "food")

            case "outdoor":
                cell.tagImage.image = UIImage(named: "outdoor")

            case "sport":
                cell.tagImage.image = UIImage(named: "sport")

            case "shopping":
                cell.tagImage.image = UIImage(named: "shopping")
            
            default: break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        let details = self.activities[row]
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = ActivityDetailsViewController(nibName: "ActivityDetailsViewController", bundle: nil)
        detailVC.details = details
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func triggerNotification() {
        
        var vc = PlanBViewController()
        vc.activityId = button
        button += 1
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addEvent(_ sender: UIButton) {
    
        let vc = CreateEventTableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
