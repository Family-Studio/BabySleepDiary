//
//  ContentView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI

struct SleepsView: View {
    @StateObject var realmManager = RealmManager()
    @Environment(\.scenePhase) private var scenePhase
    @Binding var isNight: Bool
    @Binding var startTime: Date?
    @Binding var endTime: Date?

    var body: some View {
        VStack() {
            SleepHeaderView()
                .environmentObject(realmManager)
            }
            .background(.white)
            .scrollContentBackground(.hidden)
            Spacer()
        SleepFooterView(isNight: $isNight, startTime: $startTime, endTime: $endTime)
                .environmentObject(realmManager)
        }
}

struct SleepLogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SleepsView(isNight: .constant(true), startTime: .constant(.now), endTime: .constant(.now))
        }
    }
}
