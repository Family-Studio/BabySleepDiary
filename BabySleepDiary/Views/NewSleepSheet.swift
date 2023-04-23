//
//  NewSleepSheet.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 18/04/2023.
//

import SwiftUI

struct NewSleepSheet: View {
    @State private var newSleep = SleepLog.emptySleep
    @Binding var isPresentingNewSleepView: Bool
    @Binding var sleeps: [SleepLog]
    
    var body: some View {
        NavigationStack {
            SleepEditView(data: $newSleep)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewSleepView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            sleeps.append(newSleep)
                            isPresentingNewSleepView = false
                        }
                    }
                }
        }
    }
}

struct NewSleepSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewSleepSheet(isPresentingNewSleepView: .constant(true), sleeps: .constant(SleepLog.sleeps))
    }
}