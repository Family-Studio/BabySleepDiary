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
                            HStack() {
                                Spacer()
                                Label("5 hours 50 minutes", systemImage: "clock.arrow.circlepath")
                                    .labelStyle(.titleAndIcon)
                                    .font(.footnote).bold()
                                    .foregroundStyle(Color(.secondaryLabel))
                            }
                            .listRowBackground(Color.clear)
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
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                SleepFooterView()
                    .environmentObject(realmManager)
            }
            .scrollContentBackground(.hidden)
            .background(Color(.secondarySystemBackground))
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
