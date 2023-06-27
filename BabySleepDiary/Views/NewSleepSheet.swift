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
    @Binding var isNight: Bool
    @Binding var startTime: Date?
    @Binding var endTime: Date?
    
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
                            realmManager.addSleep(isNight: isNight, startTime: startTime, endTime: endTime)
                            isPresentingNewSleepView = false
                        }
                    }
                }
        }
    }
}

struct NewSleepSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewSleepSheet(isPresentingNewSleepView: .constant(true), isNight: .constant(true), startTime: .constant(.now), endTime: .constant(.now))
            .environmentObject(RealmManager())
    }
}
