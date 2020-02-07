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
    
    func sendNotification(title: String,
                          body: String,
                          delayInterval: DateComponents?) {
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.body = body
        
        var delayTimeTrigger: UNCalendarNotificationTrigger?
        
        if let delayInterval = delayInterval {
            delayTimeTrigger = UNCalendarNotificationTrigger(dateMatching: delayInterval, repeats: false)
        }
        
        notificationContent.sound = UNNotificationSound.default
        
        UNUserNotificationCenter.current().delegate = self
        
        let request = UNNotificationRequest(identifier: "TestLocalNotification", content: notificationContent, trigger: delayTimeTrigger)
        
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
