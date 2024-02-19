//
//  DateAndTime.swift
//  UIElements
//
//  Created by Tony Chen on 27/1/2024.
//

import SwiftUI

struct DateAndTime: View {
    @State var date = Date()
    let startDate = Calendar.current.date(from: DateComponents(year: 2024)) ?? Date()
    let endDate = Date()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, content: {
                VStack {
                    DatePicker("Select future date",
                               selection: $date,
                               in: Date()...,
                               displayedComponents: .date)
                    .padding()
                    
                    DatePicker("Select past date",
                               selection: $date,
                               in: ...Date(),
                               displayedComponents: .date)
                    .padding()
                    
                    DatePicker("Select date in specific range",
                               selection: $date,
                               //in: Date()...Date().addingTimeInterval(36000),
                               in: startDate...endDate,
                               displayedComponents: .date)
                    .padding()
                    
                    DatePicker("Select time",
                               selection: $date,
                               displayedComponents: .hourAndMinute)
                    .padding()
                    
                    DatePicker("Select Date and Time",
                               selection: $date)
                    .padding()
                    
                    DatePicker("Calender and time",
                               selection: $date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                }
            })
            .navigationTitle("Date")
        }
    }
}

#Preview {
    DateAndTime()
}
