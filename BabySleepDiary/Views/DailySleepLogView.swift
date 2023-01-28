//
//  ContentView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI

struct DailySleepLogView: View {
    
    let sleeps: [DailySleepLog]

    var body: some View {
        VStack() {
            DailySleepHeaderView()
            List {
                ForEach(sleeps) { sleep in
                    NavigationLink(destination: Text(sleep.sleepDuration)) {
                        SleepCardView(sleep: sleep)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(sleep.theme.mainColor)
                }
            }
            .background(.white)
            .scrollContentBackground(.hidden)
            Spacer()
            ZStack {
                DailySleepFooterView()
            }
        }
    }
}

struct SleepLogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DailySleepLogView(sleeps: DailySleepLog.sleeps)
        }
    }
}
