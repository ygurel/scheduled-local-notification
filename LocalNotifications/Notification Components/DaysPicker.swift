//
//  DaysPicker.swift
//  LocalNotifications
//
//  Created by Yusuf Gürel on 8.04.2024.
//

import SwiftUI

struct DaysPicker: View {
    @State var dateComponents = DateComponents()
    @State var selectedDays: [Day] = []
    var body: some View {
        HStack(spacing: 15) {
            ForEach(Day.allCases, id: \.self) { day in
                Text(String(day.rawValue.first!))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(selectedDays.contains(day) ? Color("ButtonPurple").cornerRadius(10) : Color.gray.cornerRadius(10))
                    .onTapGesture {
                        if selectedDays.contains(day) {
                            selectedDays.removeAll(where: {$0 == day})
                            print(selectedDays)
                        } else {
                            selectedDays.append(day)
                            print(selectedDays)
                        }
                    }
            }
        }
    }
}

#Preview {
    DaysPicker()
}

enum Day: String, CaseIterable {
    case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
}
