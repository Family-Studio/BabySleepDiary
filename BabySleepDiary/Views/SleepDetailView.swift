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
                Label("\(sleep.startTime) (start time)", systemImage: "play")
                Label("\(sleep.endTime) (end time)", systemImage: "stop")
                Label("\(sleep.sleepDuration) (duration)", systemImage: "alarm")
            }
            Section(header: Label("Actions", systemImage: "slider.horizontal.3")) {
                Label("Edit", systemImage: "slider.horizontal.2.gobackward")
                Label("Detete", systemImage: "trash")
                    .foregroundColor(.red)
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
