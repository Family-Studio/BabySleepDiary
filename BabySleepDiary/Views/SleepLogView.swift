//
//  ContentView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI

struct SleepLogView: View {
    
    @Binding var sleeps: [SleepLog]

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
        }
    }
}

struct SleepLogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SleepLogView(sleeps: .constant(SleepLog.sleeps))
        }
    }
}
