//
//  SleepCardView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 17/01/2023.
//

import SwiftUI

struct SleepCardView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                Label("5 hours 59 minutes", systemImage: "clock.arrow.circlepath")
                    .labelStyle(.titleAndIcon)
                    .font(.footnote).bold()
            }
            Divider()
            HStack {
                VStack {
                    Text("22:12")
                    Spacer()
                    HStack {
                        Divider()
                    }
                    HStack{
                        Spacer()
                        Image(systemName: "questionmark.app")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                        Spacer()
                    }
                    .frame(width: 32.0, height: 32.0)
                    Spacer()
                    HStack {
                        Divider()
                    }
                    Text("13:00")
                }
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Day sleep:")
                    Text("5 hours 59 minutes").bold()
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
        SleepCardView()
            .background(Color("spring"))
            .previewLayout(.fixed(width: 400, height: 150))
            .environmentObject(RealmManager())
    }
}
