//
//  CreateEventController.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/10.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import Foundation
import UIKit

class CreateEventTableViewController: UITableViewController {

    let datePicker: UIDatePicker = UIDatePicker()
    let formatter = DateFormatter()
    var eventData: EventModel?

    override func viewDidLoad() {

        formatter.dateFormat = "yyyy-MM-dd H:mm"
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "CreateEventTableViewCell", bundle: nil), forCellReuseIdentifier: "CreateEventTableViewCell")

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1

    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        return 800

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 800

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateEventTableViewCell") as! CreateEventTableViewCell

        cell.startTimeButton.setTitle(Constants.startTime, for: .normal)
        cell.endTimeButton.setTitle(Constants.endTime, for: .normal)

        cell.startTimeButton.addTarget(self,
                                       action: #selector(self.startDatePicker),
                                       for: .touchUpInside)

        cell.endTimeButton.addTarget(self,
                                     action: #selector(self.endDatePicker),
                                     for: .touchUpInside)

//        self.eventData = EventModel(eventTitle: cell.titleTextField.text!,
//                                    eventType: cell.eventType,
//                                    description: cell.descirptionTextView.text,
//                                    optionalLabel: cell.optionalTextField.text ?? "",
//                                    eventDate: cell.startTimeButton.title(for: .normal)!,
//                                    eventPlace: cell.locationTextField.text!,
//                                    eventLatitude: 123.123,
//                                    eventLongitude: 123.123,
//                                    tags: cell.tagsTextField.text ?? "",
//                                    user_id: "")

        return cell
    }

    func startDatePicker() {

        let datePickerAlert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n",
                                                message: nil,
                                                preferredStyle: .actionSheet)

        let okAction = UIAlertAction(title: "Enter", style: .default)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        datePicker.frame = CGRect(x: 35,
                                  y: 10,
                                  width: datePicker.bounds.width,
                                  height: datePicker.bounds.height)

        datePicker.minimumDate = Date()

        datePickerAlert.view.addSubview(datePicker)
        datePickerAlert.addAction(okAction)
        datePickerAlert.addAction(cancelAction)

        datePicker.addTarget(self,
                             action: #selector(self.startDatePickerChanged),
                             for: .valueChanged)

        self.present(datePickerAlert, animated: true, completion: nil)
        
    }

    func endDatePicker() {

        let datePickerAlert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n",
                                                message: nil,
                                                preferredStyle: .actionSheet)

        let okAction = UIAlertAction(title: "Enter", style: .default)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        datePicker.frame = CGRect(x: 35,
                                  y: 10,
                                  width: datePicker.bounds.width,
                                  height: datePicker.bounds.height)

        datePicker.minimumDate = Date()

        datePickerAlert.view.addSubview(datePicker)
        datePickerAlert.addAction(okAction)
        datePickerAlert.addAction(cancelAction)

        datePicker.addTarget(self,
                             action: #selector(self.endDatePickerChanged),
                             for: .valueChanged)

        self.present(datePickerAlert, animated: true, completion: nil)

    }

    func startDatePickerChanged() {

        Constants.startTime = formatter.string(from: datePicker.date)

    }

    func endDatePickerChanged() {

        Constants.endTime = formatter.string(from: datePicker.date)

    }
}
//class CreateEventTableViewController: UITableViewController {
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//
//    }
//
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return 1
//
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//
//}
