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
    
    let eventManager = EventManager.shared
    let user = UserManager.shared.user
    var activities: [[String : Any]] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MyActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.title = Constants.appName
        self.addEventButton.layer.cornerRadius = 8
        
        //test
        let outdoor: [String : Any] = ["activity_id": 0, "title": "簡報松二日遊", "type":"outdoor", "description": "由校友跨屆組成的隊伍，需要在 32 小時內發想創意、分工合作，實際動手開發出能解決真實問題的作品，為生活開創更多可能～ 最終成果將在粉專揭曉，敬請期待！", "actDate": "10", "actTh": "th", "actMonth": "June, Saturday", "actTime": "08:00 AM", "people": "30", "actPlace": "台北市信義區基隆路一段178號2樓"]
        let food: [String : Any] = ["activity_id": 1, "title": "飢餓32小時", "type":"food", "description": "由校友跨屆組成的隊伍，需要在 32 小時內發想創意、分工合作，為生命開創更多可能～ 還活著的人明天將在粉專揭曉，敬請期待！", "actDate": "11", "actTh": "th", "actMonth": "January, Sunday", "actTime": "06:00 AM", "people": "15", "actPlace": "台北市信義區基隆路一段180號"]
        let movie: [String : Any] = ["activity_id": 2, "title": "大尾鱸鰻奇觀", "type":"movie", "description": "探索IMDB評價極限，讓你大開眼界", "actDate": "01", "actTh": "st", "actMonth": "March, Thursday", "actTime": "04:20 PM", "people": "4", "actPlace": "台北市信義區華納威秀"]
        
        self.activities.append(outdoor)
        self.activities.append(food)
        self.activities.append(movie)
        
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
    
    @IBAction func addEvent(_ sender: UIButton) {
    
    
    }
}
