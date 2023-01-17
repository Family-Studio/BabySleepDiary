//
//  ContentView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI

struct SleepLogView: View {
    
    @State var selectedDate = Date()
    var closedRange: ClosedRange<Date> {
        let currentDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let monthAgo = Calendar.current.date(byAdding: .day, value: -30, to: Date())!
        return monthAgo...currentDate
    }
    var body: some View {
        VStack() {
            HStack() {
                Button(action: {}) {
                    Label("", systemImage: "arrow.left")
                }
                Spacer()
                DatePicker("", selection: $selectedDate, in: closedRange, displayedComponents: .date)
                    .labelsHidden()
                    .frame(alignment: .center)
                Spacer()
                Button(action: {}) {
                    Label("", systemImage: "arrow.right")
                }
            }
            Button(action: {}) {
                Label("Start", systemImage: "play")
            }
            Spacer()
            Button(action: {}) {
                Label("Add", systemImage: "plus")
            }
        }
        .padding()
    }
}

struct SleepLogView_Previews: PreviewProvider {
    static var previews: some View {
        SleepLogView()
    }
}
