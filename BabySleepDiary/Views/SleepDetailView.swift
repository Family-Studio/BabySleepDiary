//
//  SleepDetailView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 28/01/2023.
//

import SwiftUI

struct SleepDetailView: View {
    @Binding var sleep: DailySleep
    
    @State private var editingSleep = DailySleep.emptySleep
    @State private var isPresentingEditView = false
    let saveAction: ()->Void
    
    var body: some View {
        List {
            Section(header: Label("\(sleep.dayOrNightSleep) sleep details", systemImage: sleep.dayOrNightIcon)) {
                HStack {
                    Label("Start time", systemImage: "play")
                    Spacer()
                    Text("\(sleep.startTime)")
                }
                HStack {
                    Label("End time", systemImage: "stop")
                    Spacer()
                    Text("\(sleep.endTime)")
                }
                HStack {
                    Label("Duration", systemImage: "alarm")
                    Spacer()
                    Text("\(sleep.sleepDuration)")
                }
            }
            Section(header: Label("Settings", systemImage: "slider.horizontal.2.square.on.square")) {
                HStack {
                    Label("Theme", systemImage: "theatermask.and.paintbrush")
                    Spacer()
                    ThemeView(theme: sleep.theme)
                }
            }
            Section(header: Label("Actions", systemImage: "slider.horizontal.3")) {
                Label("Edit", systemImage: "slider.horizontal.2.gobackward")
                        .foregroundColor(.accentColor)
                        .font(.headline)
                        .onTapGesture {
                            isPresentingEditView = true
                            editingSleep = sleep
                        }
                Label("Detete", systemImage: "trash")
                    .foregroundColor(.red)
                    .font(.headline)
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                SleepEditView(sleep: $editingSleep)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button ("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                sleep = editingSleep
                                saveAction()
                                
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
            SleepDetailView(sleep: .constant(DailySleep.sleeps[0]), saveAction: {})
        }
    }
}
