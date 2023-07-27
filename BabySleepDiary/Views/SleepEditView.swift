//
//  SleepEditView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 30/01/2023.
//

import SwiftUI

struct SleepEditView: View {
    @EnvironmentObject var realmManager: RealmManager
    @Binding var isNight: Bool
    @Binding var startTime: Date
    @Binding var endTime: Date
    
    var body: some View {
        Form {
            Section(header: Text("Edit the sleep")) {
                HStack {
                    Text("Sleep period:")
                    Spacer()
                    Toggle(isOn: $isNight) {
                        Label((isNight ? "Night" : "Day"), systemImage: (isNight ? "moon.stars" : "sun.max"))
                    }
                    .toggleStyle(.button)
                }
                HStack {
                    Text("Start time:")
                    Spacer()
                    DoubleDatePickerView(selectedDate: $startTime)
                }
                HStack {
                    Text("End time:")
                    Spacer()
                    DoubleDatePickerView(selectedDate: $endTime)
                }
            }
            Section(header: Text("Preview")) {
                SleepCardView(isNight: isNight, startTime: startTime, endTime: endTime)
            }
        }
        .background(Color("secondaryBackgroundColor"))
    }
}

struct SleepEditView_Previews: PreviewProvider {
    static var previews: some View {
        SleepEditView(isNight: .constant(true), startTime: .constant(Date()), endTime: .constant(Date().addingTimeInterval(3700)))
            .environmentObject(RealmManager())
    }
}
