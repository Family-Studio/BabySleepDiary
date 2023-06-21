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
    @State private var startTime: Date?
    @State private var endTime: Date?
    
    var body: some View {
        Form {
            Section(header: Text("Edit sleep")) {
                Toggle(isOn: $isNight) {
                    if isNight {
                        Label("Night", systemImage: "moon.stars")
                    } else {
                        Label("Day", systemImage: "sun.max")
                    }
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
