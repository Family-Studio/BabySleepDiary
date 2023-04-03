//
//  SleepEditView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 30/01/2023.
//

import SwiftUI

struct SleepEditView: View {
    @State private var data = SleepLog.Data()
    
    var body: some View {
        Form {
            Section(header: Text("Edit sleep")) {
                TextField("Start time", text: $data.startTime)
                TextField("End time", text: $data.endTime)
                TextField("Night or day sleep", text: $data.dayOrNightSleep)
                ThemePickerView(selection: $data.theme)
            }
        }
    }
}

struct SleepEditView_Previews: PreviewProvider {
    static var previews: some View {
        SleepEditView()
    }
}
