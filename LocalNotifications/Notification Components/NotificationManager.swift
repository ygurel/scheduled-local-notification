//
//  NotificationManager.swift
//  LocalNotifications
//
//  Created by Yusuf Gürel on 8.04.2024.
//

import UIKit
import UserNotifications

class NotificationManager: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request permission to display notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted")
            } else {
                print("Notification permission denied")
            }
        }
        
        // Set the delegate to handle notification responses
        UNUserNotificationCenter.current().delegate = self
        
        // Schedule periodic notifications
        scheduleNotifications(numberOfNotifications: 60) // Example: Schedule 5 notifications
    }
    
    func scheduleNotifications(numberOfNotifications: Int) {
        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Your Notification Title"
        content.body = "Your Notification Body"
        content.sound = .default
        content.userInfo = ["url": "vocappulary://favorite"]
        
        // Define the time range for notifications
        let startDate = DateComponents(hour: 18, minute: 35) // Start time
        let endDate = DateComponents(hour: 19, minute: 35) // End time
        
        // Calculate interval between notifications
        let totalMinutes = (endDate.hour! - startDate.hour!) * 60 + (endDate.minute! - startDate.minute!)
        guard totalMinutes > 0 else {
            print("End time must be after start time")
            return
        }
        
        let interval = max(totalMinutes / numberOfNotifications, 1) // Ensure interval is at least 1 minute
        
        // Define the days of the week for notifications
        let daysOfWeek: [Int] = [1, 3, 5] // Monday, Wednesday, Friday
        
        // Create date components for start and end times
        var date = Date()
        let calendar = Calendar.current
        let currentDateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        var startDateComponents = startDate
        var endDateComponents = endDate
        startDateComponents.year = currentDateComponents.year
        startDateComponents.month = currentDateComponents.month
        startDateComponents.day = currentDateComponents.day
        endDateComponents.year = currentDateComponents.year
        endDateComponents.month = currentDateComponents.month
        endDateComponents.day = currentDateComponents.day
        
        // Create notification triggers for each day of the week within the specified time range
        for day in daysOfWeek {
            date = calendar.date(from: currentDateComponents)!
            let weekday = calendar.component(.weekday, from: date)
            let daysToAdd = (day + 7 - weekday) % 7
            date = calendar.date(byAdding: .day, value: daysToAdd, to: date)!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            let dayOfWeek = dateFormatter.string(from: date)
            print("Scheduling notification for \(dayOfWeek)")
            
            let triggerDate = calendar.date(bySettingHour: startDate.hour!, minute: startDate.minute!, second: 0, of: date)!
            let endDate = calendar.date(bySettingHour: endDate.hour!, minute: endDate.minute!, second: 0, of: date)!
            
            if triggerDate <= endDate {
                // Schedule notifications at regular intervals
                for i in 0..<numberOfNotifications {
                    let triggerTimeInterval = TimeInterval(i * interval * 60)
                    if triggerTimeInterval > 0 {
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: triggerTimeInterval, repeats: false)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        UNUserNotificationCenter.current().add(request)
                    }
                }
            }
        }
    }
}

extension NotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Open a URL when notification is tapped
        let userInfo = response.notification.request.content.userInfo
        if let urlString = userInfo["url"] as? String, let url = URL(string: urlString) {
            DispatchQueue.main.async {
                UIApplication.shared.open(url)
            }
        }
        
        // Call the completion handler after handling the response
        completionHandler()
    }
}

