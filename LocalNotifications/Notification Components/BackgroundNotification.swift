//
//  BackgroundNotification.swift
//  LocalNotifications
//
//  Created by Yusuf Gürel on 29.04.2024.
//

import UIKit
import UserNotifications
import BackgroundTasks

class BackgroundNotificationManager {
    
    static let shared = NotificationManager()
    let notificationManager = NotificationManager()
    
    init() {}
    
    func scheduleBackgroundRefresh() {
        // Create background refresh task
        let taskRequest = BGAppRefreshTaskRequest(identifier: "com.gurel.LocalNotifications.refresh")
        taskRequest.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60) // Schedule the task for one hour from now
        
        do {
            try BGTaskScheduler.shared.submit(taskRequest)
            print("Background refresh task scheduled successfully.")
        } catch {
            print("Unable to schedule background refresh task: \(error.localizedDescription)")
        }
    }
    
    func handleAppRefresh(task: BGAppRefreshTask) {
        scheduleNotification()
        task.setTaskCompleted(success: true)
    }
    
    private func scheduleNotification() {
        notificationManager.scheduleNotifications(numberOfNotifications: 20)
        print("Scheduled notifications in the background.")
    }
}
