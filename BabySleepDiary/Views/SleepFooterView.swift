//
//  DailySleepFooterView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 28/01/2023.
//

import SwiftUI

struct SleepFooterView: View {
    @State private var isPresentingNewSleepView = false
    @Binding var sleeps: [SleepLog]
    
    var body: some View {
        HStack {
            Button(action: {isPresentingNewSleepView = true}) {
                Label("Add", systemImage: "plus")
            }
            .padding(24.0)
            Spacer()
            Button(action: {}) {
                Label("Start", systemImage: "play")
            }
            .padding(24.0)
        }
        .padding(0)
        .sheet(isPresented: $isPresentingNewSleepView) {
            NewSleepSheet(isPresentingNewSleepView: $isPresentingNewSleepView, sleeps: $sleeps)
        }
    }
}

struct DailySleepFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SleepFooterView(sleeps: .constant(SleepLog.sleeps))
    }
}
