//
//  SleepDetailView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 28/01/2023.
//

import SwiftUI

struct SleepDetailView: View {
    let sleep: SleepLog
    
    var body: some View {
        List {
            Section(header: Label("\(sleep.dayOrNightSleep) sleep details", systemImage: sleep.dayOrNightIcon)) {
                HStack {
                    Label("Start time", systemImage: "play")
                    Spacer()
                    Text("\(sleep.startTime)")
                }
                HStack {
                    Label("End time", systemImage: "stop")
                    Spacer()
                    Text("\(sleep.endTime)")
                }
                HStack {
                    Label("Duration", systemImage: "alarm")
                    Spacer()
                    Text("\(sleep.sleepDuration)")
                }
            }
            Section(header: Label("Actions", systemImage: "slider.horizontal.3")) {
                NavigationLink(destination: SleepEditView()) {
                    Label("Edit", systemImage: "slider.horizontal.2.gobackward")
                        .foregroundColor(.accentColor)
                        .font(.headline)
                }
                Label("Detete", systemImage: "trash")
                    .foregroundColor(.red)
                    .font(.headline)
            }
        }
    }
}

struct SleepDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SleepDetailView(sleep: SleepLog.sleeps[0])
        }
    }
}
