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
    var body: some View {
        Form {
            Section(header: Text("Add or edit the sleep")) {
                HStack {
                    Text("Start time: ")
                    Spacer()
                    DoubleDatePickerView()
                }
                HStack {
                    Text("End time: ")
                    Spacer()
                    DoubleDatePickerView()
                }
                HStack {
                    Text("Duration:")
                    Spacer()
                    Text("5 hours 59 minutes")
                        .bold()
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
