//
//  DailySleepFooterView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 28/01/2023.
//

import SwiftUI

struct SleepFooterView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Label("Add", systemImage: "plus")
            }
            .padding(24.0)
            Spacer()
            Button(action: {}) {
                Label("Start", systemImage: "play")
            }
            .padding(24.0)
        }
        .padding(0)
    }
}

struct DailySleepFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SleepFooterView()
    }
}
