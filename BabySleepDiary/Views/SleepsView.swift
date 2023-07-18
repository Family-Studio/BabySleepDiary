//
//  ContentView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI

struct SleepsView: View {
    @StateObject var realmManager = RealmManager()    
    
    var body: some View {
        NavigationStack {
            VStack() {
                SleepHeaderView()
                    .environmentObject(realmManager)
                Spacer()
                List {
                    ForEach(realmManager.sleeps, id: \.id) { sleep in
                        if !sleep.isInvalidated {
                            NavigationLink(destination: SleepFooterView()) {
                                SleepCardView(isNight: sleep.isNight, startTime: sleep.startTime ?? .now, endTime: sleep.endTime ?? .now)
                                    .swipeActions(edge: .trailing) {
                                        Button(role: .destructive) {
                                            realmManager.deleteSleep(id: sleep.id)
                                        } label: {
                                            Label("Delete", systemImage: "trash")

                                        }
                                    }
                            }
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(12)
                            .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                SleepFooterView()
                    .environmentObject(realmManager)
            }
            .background(Color(.primaryBackground))
            .scrollContentBackground(.hidden)
        }
    }
}

struct SleepLogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SleepsView()
                .environmentObject(RealmManager())
        }
    }
}
