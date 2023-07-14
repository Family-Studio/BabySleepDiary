//
//  SleepDetailView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 28/01/2023.
//

import SwiftUI

struct SleepDetailView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var isPresentingEditView = false
    @Binding var isNight: Bool
    @Binding var startTime: Date
    @Binding var endTime: Date
    
    var body: some View {
        List {
            Section(header: Label("Day sleep details", systemImage: "questionmark.app")) {
                HStack {
                    Label("Start time", systemImage: "play")
                    Spacer()
                    Text("\(startTime.formatted())")
                }
                HStack {
                    Label("End time", systemImage: "stop")
                    Spacer()
                    Text("\(endTime.formatted())")
                }
                HStack {
                    Label("Duration", systemImage: "alarm")
                    Spacer()
                    Text("\(Sleep().calculateDuration(startTime: startTime, endTime: endTime))")
                }
            }
            Section(header: Label("Actions", systemImage: "slider.horizontal.3")) {
                Label("Edit", systemImage: "slider.horizontal.2.gobackward")
                    .foregroundColor(.accentColor)
                    .font(.headline)
                    .onTapGesture {
                        isPresentingEditView = true
                    }
                Label("Detete", systemImage: "trash")
                    .foregroundColor(.red)
                    .font(.headline)
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                SleepEditView(realmManager: _realmManager, isNight: $isNight, startTime: $startTime, endTime: $endTime)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button ("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
    }
}

struct SleepDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SleepDetailView(isNight: .constant(true), startTime: .constant(.now), endTime: .constant(.now.addingTimeInterval(3800)))
                .environmentObject(RealmManager())
        }
    }
}
