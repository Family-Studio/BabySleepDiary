//
//  ContentView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI

struct SleepsView: View {
    @Binding var sleeps: [DailySleep]
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void

    var body: some View {
        VStack() {
            SleepHeaderView()
            List {
                ForEach($sleeps) { $sleep in
                    NavigationLink(destination: SleepDetailView(sleep: $sleep)) {
                        SleepCardView(sleep: sleep)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(sleep.theme.mainColor)
                }
            }
            .background(.white)
            .scrollContentBackground(.hidden)
            Spacer()
            SleepFooterView(sleeps: $sleeps)
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive { saveAction() }
                }
        }
    }
}

struct SleepLogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SleepsView(sleeps: .constant(DailySleep.sleeps), saveAction: {})
        }
    }
}
