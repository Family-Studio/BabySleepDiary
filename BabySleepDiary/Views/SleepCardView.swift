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
        VStack {
            HStack(alignment: .center) {
                Spacer()
                Label("\(sleep.wakeDuration)", systemImage: "clock.arrow.circlepath")
                    .labelStyle(.titleAndIcon)
                    .font(.footnote).bold()
            }
            Divider()
            HStack {
                VStack {
                    Text(sleep.endTime)
                    Spacer()
                    HStack {
                        Divider()
                    }
                    HStack{
                        Spacer()
                        Image(systemName: "\(sleep.dayOrNightIcon)")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Spacer()
                    }
                    .frame(width: 32.0, height: 32.0)
                    Spacer()
                    HStack {
                        Divider()
                    }
                    Text(sleep.endTime)
                }
                VStack(alignment: .leading) {
                    Spacer()
                    Text("\(sleep.dayOrNightSleep) sleep:")
                    Text(sleep.sleepDuration).bold()
                    Spacer()
                    }
                    Spacer()
                }
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

//HStack() {
//                Spacer()
//                Label("\(sleep.wakeTime)", systemImage: "clock.arrow.circlepath")
//                    .frame(alignment: .leading)
//                    .font(.callout).bold()
//            }
//            Divider()
//            HStack {
//                VStack {
//                    Spacer()
//                    HStack{
//                        Text(sleep.endTime)
//                        Spacer()
//                    }
//                    Spacer()
//                    HStack {
//                        Label("", systemImage: sleep.dayAndNightIcon)
//                            .font(.system(size: 34))
//                        Spacer()
//                        VStack(alignment: .leading) {
//                            Text("\(sleep.isNithtSleep) sleep:")
//                            Text(sleep.sleepDuration)
//                                .font(.headline)
//                        }
//                    }
//                    Spacer()
//                    HStack {
//                        Text(sleep.startTime)
//                        Spacer()
//                    }
//                }
//            }
//            Spacer()
