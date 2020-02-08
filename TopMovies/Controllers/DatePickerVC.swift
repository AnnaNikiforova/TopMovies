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
        
        // sets date format and puts selected viewing date and time on the screen
        let formatter = DateFormatter()
       formatter.dateFormat = "EEEE, d MMM yyyy HH:mm"
       selectedTimeAndDateLabel.text = formatter.string(from: datePicker.date)
        
        // selected date and time from DatePicker triggers the notification
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute], from: datePicker.date)
        notificationPublisher.sendNotification(title: "Time to watch a movie!", body: "Your viewing is about to start.", dateInterval: triggerDate)
    }
    
}



