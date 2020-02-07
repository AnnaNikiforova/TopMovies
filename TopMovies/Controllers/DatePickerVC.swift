//
//  DatePickerVC.swift
//  TopMovies
//
//  Created by Анна Никифорова on 07.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var selectedTimeAndDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var setViewingButton: UIButton!
    
    private let notificationPublisher = NotificationPublisher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker?.minimumDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
       
    }
    
    // sets viewing date and time
    @IBAction func dateAndTimeChosen(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM yyyy HH:mm"
       selectedTimeAndDateLabel.text = formatter.string(from: datePicker.date)
        notificationPublisher.sendNotification(title: "Attention", body: "Blah", delayInterval: nil)
    }
    
}



