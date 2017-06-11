//
//  ActivityDetailsViewController.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/11.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import UIKit
import MapKit

class ActivityDetailsViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tagImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var thLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var planBImage: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var joinLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    var details: [String : Any] = [:]
    let eventManager = EventManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        self.mapView.showsUserLocation = false
        self.setUpMap()

        self.title = self.details["title"] as? String ?? ""
        
        self.topView.layer.cornerRadius = self.topView.layer.bounds.width / 2
        self.bigView.layer.cornerRadius = 10
        self.timeView.layer.cornerRadius = 8
        self.locationLabel.text = self.details["actPlace"] as? String ?? "----"
        self.descriptionLabel.text = self.details["description"] as? String ?? "----"
        self.dateLabel.text = self.details["actDate"] as? String ?? "--"
        self.thLabel.text = self.details["actTh"] as? String ?? "th"
        self.monthLabel.text = self.details["actMonth"] as? String ?? "May, Monday"
        self.timeLabel.text = self.details["actTime"] as? String ?? "09:10 AM"
        let people = self.details["people"] as? String ?? "1"
        self.joinLabel.text = "\(people) people are going"
        
        switch self.details["type"] as? String ?? "----" {
            
        case "movie":
            self.planBImage.image = UIImage(named: "movieRating")
            self.tagImageView.image = UIImage(named: "movie")
            
        case "food":
            self.planBImage.image = UIImage(named: "foodRating")
            self.tagImageView.image = UIImage(named: "food")
            
        case "outdoor":
            self.planBImage.image = UIImage(named: "weather")
            self.tagImageView.image = UIImage(named: "outdoor")
            
        case "sport":
            self.planBImage.image = UIImage(named: "weather")
            self.tagImageView.image = UIImage(named: "sport")
            
        case "shopping":
            self.planBImage.image = UIImage(named: "weather")
            self.tagImageView.image = UIImage(named: "shopping")
            
        default: break
        }
 
    }

    func setUpMap() {
        
        
        
        
        
        
        
        
    }

}
