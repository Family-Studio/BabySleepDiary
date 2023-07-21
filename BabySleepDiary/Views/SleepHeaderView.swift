//
//  DailySleepHeaderView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 28/01/2023.
//

import SwiftUI

struct SleepHeaderView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State var selectedDate = Date()
    var closedRange: ClosedRange<Date> {
        let currentDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let monthAgo = Calendar.current.date(byAdding: .day, value: -30, to: Date())!
        return monthAgo...currentDate
    }
    var body: some View {
        VStack {
            HStack() {
                Button(action: {}) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("primaryBackgroundColor"))
                        Image(systemName: "arrow.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28)
                            .foregroundColor(Color("primaryLabelColor"))
                    }
                    .frame(width: 44, height: 44)
                    .padding(16.0)
                }
                Spacer()
                DatePicker("", selection: $selectedDate, in: closedRange, displayedComponents: .date)
                    .labelsHidden()
                    .frame(alignment: .center)
                Spacer()
                Button(action: {}) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("primaryBackgroundColor"))
                        Image(systemName: "arrow.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28)
                            .foregroundColor(Color("primaryLabelColor"))
                    }
                    .frame(width: 44, height: 44)
                    .padding(16.0)
                }
            }
        }
    }
}

struct DailySleepHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SleepHeaderView()
            .background(Color(.secondarySystemBackground))
            .environmentObject(RealmManager())
    }
}
