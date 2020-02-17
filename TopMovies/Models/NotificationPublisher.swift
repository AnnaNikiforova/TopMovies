//
//  NotificationPublisher.swift
//  TopMovies
//
//  Created by Анна Никифорова on 07.02.2020.
//  Copyright © 2020 Анна Никифорова. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationPublisher: NSObject {
    
    // creates notification content
    func sendNotification(title: String,
                          body: String,
                          dateInterval: DateComponents?) {
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.body = body
        
        var delayDateTrigger: UNCalendarNotificationTrigger?
        
        if let dateInterval = dateInterval {
            delayDateTrigger = UNCalendarNotificationTrigger(dateMatching: dateInterval, repeats: false)
        }
        
        notificationContent.sound = UNNotificationSound.default
        
        UNUserNotificationCenter.current().delegate = self
        
        // creates request for user permission
        let uniqueIdentifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: uniqueIdentifier, content: notificationContent, trigger: delayDateTrigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

extension NotificationPublisher: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("The notification is about to be presented")
        completionHandler([.sound, .alert])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let identifier = response.actionIdentifier
        
        switch identifier {
        case UNNotificationDismissActionIdentifier:
            print("The notification was dismissed")
            completionHandler()
        case UNNotificationDefaultActionIdentifier:
            print("The user opened the app from the notification")
            completionHandler()
        default:
            print("The default case was called")
            completionHandler()
        }
    }
}
