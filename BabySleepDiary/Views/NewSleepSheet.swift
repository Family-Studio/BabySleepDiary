//
//  NewSleepSheet.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 18/04/2023.
//

import SwiftUI
import RealmSwift

struct NewSleepSheet: View {
    @Binding var isPresentingNewSleepView: Bool
    @Environment(\.dismiss) private var dismiss
    @ObservedResults(Sleep.self) var sleeps
    
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
                            let sleep = Sleep()
                            sleep.isNight = isNight
                            sleep.startTime = startTime
                            sleep.endTime = endTime
                            $sleeps.append(sleep)
                            dismiss()
                        }
                    }
                }
        }
    }
}

struct NewSleepSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewSleepSheet(isPresentingNewSleepView: .constant(true))
    }
}
