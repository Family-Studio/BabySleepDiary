//
//  SleepEditView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 30/01/2023.
//

import SwiftUI

struct SleepEditView: View {
    @Binding var sleep: DailySleep
    
    var body: some View {
        Form {
            Section(header: Text("Edit sleep")) {
                TextField("Start time", text: $sleep.startTime)
                TextField("End time", text: $sleep.endTime)
                TextField("Night or day sleep", text: $sleep.dayOrNightSleep)
                ThemePickerView(selection: $sleep.theme)
            }
        }
    }
}

struct SleepEditView_Previews: PreviewProvider {
    static var previews: some View {
        SleepEditView(sleep: .constant(DailySleep.sleeps[0]))
    }
}
