//
//  EditNotificationView.swift
//  LocalNotifications
//
//  Created by Yusuf Gürel on 7.04.2024.
//

import SwiftUI

struct EditNotificationView: View {
    
    let notificationManager = NotificationManager()
    let backgroundRefresher = BackgroundNotificationManager()

    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.gray)
                    .ignoresSafeArea(.all)
                    .opacity(0.2)
                VStack {
                    HStack {
                        Text("How many:")
                        Spacer()
                        FrequencyStepper()
                    }
                    .padding()
                    
                    HStack {
                        Text("Start at:")
                        Spacer()
                        StartTimeStepper()
                    }
                    .padding()

                    HStack {
                        Text("End at:")
                        Spacer()
                        EndTimeStepper()
                    }
                    .padding()
                    VStack {
                        HStack {
                            Text("Repeat:")
                            Spacer()
                        }
                        .padding()
                        
                        HStack {
                            DaysPicker()
                        }
                        .padding(.horizontal, 10)
                        
                        HStack{
                            Button("SAVE") {
                                // Schedule periodic notifications
                                notificationManager.scheduleNotifications(numberOfNotifications: 20)
                                backgroundRefresher.scheduleBackgroundRefresh()
                            }
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    EditNotificationView()
}
