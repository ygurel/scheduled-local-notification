//
//  RootView.swift
//  LocalNotifications
//
//  Created by Yusuf Gürel on 7.04.2024.
//

import SwiftUI

struct NotificationView: View {
    @State private var selectedNumber = 1
    @State private var isAllWordsOn = false
    @State private var isOtherOn = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ZStack {
                        NavigationLink(destination: EditNotificationView()) {
                            Rectangle()
                                .foregroundColor(Color("ButtonPurple"))
                                .frame(width: 350, height: 110)
                                .overlay(
                                    VStack {
                                        HStack {
                                            Text("All Words")
                                                .foregroundColor(.black)
                                                .font(.system(size: 20))
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            Text("Get daily notifications from all words!")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14))
                                            Spacer()
                                            Text("9:00 AM - 12:00 PM")
                                                .foregroundColor(.black)
                                                .font(.system(size: 10))
                                                .padding(.horizontal, 10)
                                                .padding(.top, 15)
                                        }
                                        
                                        Divider()
                                        HStack {
                                            Text("Frequency: 20x")
                                                .font(.system(size: 14))
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        .padding(.top, 5)
                                    }
                                    .padding(.horizontal, 10)

                                )
                            
                    }
                        HStack {
                            Toggle("", isOn: $isAllWordsOn)
                        }
                        .padding(.horizontal, 15)
                        .padding(.bottom, 60)
                    }

                    Rectangle()
                        .foregroundColor(Color("ButtonPurple"))
                        .frame(width: 350, height: 110)
                        .overlay(
                            VStack {
                                HStack {
                                    Text("Other Notifications")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Toggle("", isOn: $isOtherOn)
                                }
                                HStack {
                                    Text("Get notifications from other app features!")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                                HStack {
                                    Text("(Categories, Favorites, Collections and more!)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, 10)
                        
                                )
                }
                .padding(.horizontal, 35)
            }


        }
    }
}

#Preview {
    NotificationView()
}
