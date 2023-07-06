//
//  SleepCardView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 17/01/2023.
//

import SwiftUI

struct SleepCardView: View {
    @EnvironmentObject var realmManager: RealmManager
    var isNight: Bool
    var startTime: Date
    var endTime: Date
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                Label("5 hours 50 minutes", systemImage: "clock.arrow.circlepath")
                    .labelStyle(.titleAndIcon)
                    .font(.footnote).bold()
            }
            Divider()
            HStack {
                VStack {
                    Text("\(endTime.formatted(date: .omitted, time: .shortened))")
                    Spacer()
                    HStack {
                        Divider()
                    }
                    HStack{
                        Spacer()
                        if isNight {
                            Image(systemName: "moon.stars")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        } else {
                            Image(systemName: "sun.max")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }
                        Spacer()
                    }
                    .frame(width: 32.0, height: 32.0)
                    Spacer()
                    HStack {
                        Divider()
                    }
                    Text("\(startTime.formatted(date: .omitted, time: .shortened))")
                }
                VStack(alignment: .leading) {
                    Spacer()
                    if isNight {
                        Text("Night sleep:")
                    } else {
                        Text("Day sleep:")
                    }
                    Text("\(Sleep().calculateDuration(startTime: startTime, endTime: endTime))").bold()
                    Spacer()
                }
                Spacer()
            }
        }
        .padding(2)
    }
}

struct SleepCardView_Previews: PreviewProvider {
    static var previews: some View {
        SleepCardView(isNight: true, startTime: .now, endTime: .now.addingTimeInterval(3900))
            .background(Color("spring"))
            .previewLayout(.fixed(width: 400, height: 150))
            .environmentObject(RealmManager())
    }
}
