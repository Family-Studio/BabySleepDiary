//
//  DailySleepFooterView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 28/01/2023.
//

import SwiftUI

struct SleepFooterView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var isPresentingNewSleepView = false
    
    var body: some View {
        HStack {
            Button(action: {isPresentingNewSleepView = true}) {
                ZStack {
                    Circle()
                        .foregroundColor(Color("primaryBackgroundColor"))
                    Image(systemName: "plus.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                        .foregroundColor(Color("primaryLabelColor"))
                }
                .frame(width: 44, height: 44)
                .padding(24.0)
            }
            .padding(24.0)
            Spacer()
            Button(action: {}) {
                ZStack {
                    Circle()
                        .foregroundColor(Color("primaryBackgroundColor"))
                    Image(systemName: "play.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                        .foregroundColor(Color("primaryLabelColor"))
                }
                .frame(width: 44, height: 44)
                .padding(24.0)
            }
            .padding(24.0)
        }
        .sheet(isPresented: $isPresentingNewSleepView) {
            NewSleepSheet(realmManager: _realmManager, isPresentingNewSleepView: $isPresentingNewSleepView)
        }
    }
}

struct DailySleepFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SleepFooterView()
            .background(Color("secondaryBackgroundColor"))
            .environmentObject(RealmManager())
    }
}
