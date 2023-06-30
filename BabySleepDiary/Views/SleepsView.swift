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
    
    var body: some View {
        VStack() {
            SleepHeaderView()
                .environmentObject(realmManager)
            Spacer()
            List {
                ForEach(realmManager.sleeps, id: \.id) { sleep in
                    SleepCardView()
                }
            }
            SleepFooterView()
                .environmentObject(realmManager)
        }
        .background(.white)
        .scrollContentBackground(.hidden)
    }
}

struct SleepLogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SleepsView()
        }
    }
}
