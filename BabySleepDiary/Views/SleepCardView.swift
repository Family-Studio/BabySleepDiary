//
//  SleepCardView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 17/01/2023.
//

import SwiftUI

struct SleepCardView: View {
    let sleep: DailySleepLog
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Spacer()
                Label("\(sleep.wakeTime)", systemImage: "clock.arrow.circlepath")
                    .frame(alignment: .leading)
                    .font(.callout).bold()
            }
            Divider()
            HStack(alignment: .center) {
                VStack(alignment: .center) {
                        Text(sleep.endTime)
                    Spacer()
                    Label("", systemImage: sleep.dayAndNightIcon)
                        .labelsHidden()
                        .font(.system(size: 30))
                    Spacer()
                    Text(sleep.startTime)
                }
                VStack(alignment: .leading) {
                    Text("\(sleep.isNithtSleep) sleep:")
                    Text(sleep.sleepDuration)
                        .font(.headline)
                }
            }
            Spacer()
        }
        .padding()
        .foregroundColor(sleep.theme.accentColor)
    }
}

struct SleepCardView_Previews: PreviewProvider {
    static var sleep = DailySleepLog.sleeps[0]
    static var previews: some View {
        SleepCardView(sleep: sleep)
            .background(sleep.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 150))
    }
}
