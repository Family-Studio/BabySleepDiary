//
//  SleepCardView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 17/01/2023.
//

import SwiftUI

struct SleepCardView: View {
    let sleep: SleepLog
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(sleep.endTime)
            }
            Spacer()
            HStack(alignment: .center) {
                HStack(alignment: .center) {
                    Label("", systemImage: sleep.icon)
                        .font(.system(size: 26))
                }
                VStack(alignment: .leading) {
                    Text("Day sleep:")
                    Text(sleep.sleepDuration)
                        .font(.headline)
                }
            }
            Spacer()
            HStack {
                Text(sleep.startTime)
            }
        }
        .padding()
        .foregroundColor(sleep.theme.accentColor)
    }
}

struct SleepCardView_Previews: PreviewProvider {
    static var sleep = SleepLog.sleeps[0]
    static var previews: some View {
        SleepCardView(sleep: sleep)
            .background(sleep.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
