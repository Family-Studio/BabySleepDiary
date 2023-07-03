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
    @State var isNight: Bool = false
    @State var startTime: Date = .now
    @State var endTime: Date = .now
    
    var body: some View {
        NavigationStack {
            SleepEditView(isNight: $isNight, startTime: $startTime, endTime: $endTime)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewSleepView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            isPresentingNewSleepView = false
                            realmManager.addSleep(isNight: isNight, startTime: startTime, endTime: endTime)
                        }
                    }
                }
        }
    }
}

struct NewSleepSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewSleepSheet(isPresentingNewSleepView: .constant(true))
            .environmentObject(RealmManager())
    }
}
