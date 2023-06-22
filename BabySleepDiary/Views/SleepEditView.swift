//
//  SleepEditView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 30/01/2023.
//

import SwiftUI

struct SleepEditView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var isNight: Bool = false
    @State private var startTime = Date()
    @State private var endTime: Date?
    var closedRange: ClosedRange<Date> {
        let currentDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let monthAgo = Calendar.current.date(byAdding: .day, value: -30, to: Date())!
        return monthAgo...currentDate
    }
    var body: some View {
        Form {
            Section(header: Text("Edit sleep")) {
                HStack {
                    Text("Start time: ")
                    Spacer()
                    DatePicker("", selection: $startTime, in: closedRange, displayedComponents: .hourAndMinute)
                    DatePicker("", selection: $startTime, in: closedRange, displayedComponents: .date)
                        .labelsHidden()
                        .pickerStyle(.wheel)
                }
                HStack {
                    Text("End time: ")
                    Spacer()
                    DatePicker("", selection: $startTime, in: closedRange, displayedComponents: .hourAndMinute)
                    DatePicker("", selection: $startTime, in: closedRange, displayedComponents: .date)
                        .labelsHidden()
                        .pickerStyle(.wheel)
                }
                HStack {
                    Text("Sleep period:")
                    Spacer()
                    Toggle(isOn: $isNight) {
                        if isNight {
                            Label("Night", systemImage: "moon.stars")
                        } else {
                            Label("Day", systemImage: "sun.max")
                        }
                    }
                    .toggleStyle(.button)
                }
            }
        }
    }
}

struct SleepEditView_Previews: PreviewProvider {
    static var previews: some View {
        SleepEditView()
            .environmentObject(RealmManager())
    }
}
