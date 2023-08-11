//
//  ContentView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI
import RealmSwift

struct SleepsView: View {
    @StateObject var realmManager = RealmManager()
    @ObservedResults(Sleep.self) var sleeps
    
    var body: some View {
        NavigationStack {
            VStack() {
                SleepHeaderView()
                Spacer()
                if sleeps.isEmpty {
                    Text("No sleeps")
                }
                Spacer()
                List {
                    ForEach(sleeps, id: \.id) { sleep in
                        NavigationLink(destination: SleepFooterView()) {
                            SleepCardView(isNight: sleep.isNight, startTime: sleep.startTime ?? .now, endTime: sleep.endTime ?? .now)
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        $sleeps.remove(sleep)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                }
                .listStyle(PlainListStyle())
                .overlay(SleepFooterView())
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
        }
    }
}
