//
//  NewSleepSheet.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 18/04/2023.
//

import SwiftUI

struct NewSleepSheet: View {
    @EnvironmentObject var realmManager: RealmManager
    @Binding var isPresentingNewSleepView: Bool
    var sleepEditView: SleepEditView
    
    var body: some View {
        NavigationStack {
            SleepEditView()
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewSleepView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            realmManager.addSleep(isNight: sleepEditView.isNight, startTime: sleepEditView.startTime, endTime: sleepEditView.endTime)
                            isPresentingNewSleepView = false
                        }
                    }
                }
        }
    }
}

struct NewSleepSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewSleepSheet(isPresentingNewSleepView: .constant(true), sleepEditView: SleepEditView())
            .environmentObject(RealmManager())
    }
}
