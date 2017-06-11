//
//  CreateEventTableViewCell.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/11.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import UIKit

class CreateEventTableViewCell: UITableViewCell {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var activityTypeSegment: UISegmentedControl!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var optionalTextField: UITextField!
    @IBOutlet weak var optionalLabel: UILabel!
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var descirptionTextView: UITextView!
    @IBOutlet weak var startTimeButton: UIButton!
    @IBOutlet weak var endTimeButton: UIButton!

    let datePicker: UIDatePicker = UIDatePicker()
    let formatter = DateFormatter()
    var eventType = "outDoor"

    override func awakeFromNib() {
        
        super.awakeFromNib()


    }

    @IBAction func switchActivityType(_ sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {

        case 0:

            optionalLabel.text = "Optional"
            eventType = "outDoor"
            optionalTextField.isUserInteractionEnabled = false

        case 1:

            optionalLabel.text = "Movie Name"
            eventType = "movie"
            optionalTextField.isUserInteractionEnabled = true

        case 2:

            optionalLabel.text = "Restaurant"
            eventType = "food"
            optionalTextField.isUserInteractionEnabled = true

        case 3:

            optionalLabel.text = "Optional"
            eventType = "shopping"
            optionalTextField.isUserInteractionEnabled = false

        case 4:

            optionalLabel.text = "Optional"
            eventType = "exersice"
            optionalTextField.isUserInteractionEnabled = false

        default:

            optionalLabel.text = "Optional"

        }
    }

}
