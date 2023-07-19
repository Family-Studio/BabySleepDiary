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
            HStack {
                VStack {
                    Text("\(endTime.formatted(date: .omitted, time: .shortened))")
                    Spacer()
                    HStack {
                    }
                    HStack{
                        Spacer()
                        if isNight {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color(.accentColorGreen)) // Change the color to your preference
                                
                                Image(systemName: "moon.stars")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 28, height: 28) // Adjust the size of the image
                                    .foregroundColor(.white) // Change the color of the system image
                            }
                            .frame(width: 44, height: 44) // Adjust the overall size of the circle
                        } else {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color(.accentColorYellow)) // Change the color to your preference
                                
                                Image(systemName: "sun.max")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 28, height: 28) // Adjust the size of the image
                                    .foregroundColor(.white) // Change the color of the system image
                            }
                            .frame(width: 44, height: 44) // Adjust the overall size of the circle
                        }
                        Spacer()
                    }
                    .frame(width: 32.0, height: 32.0)
                    Spacer()
                    HStack {
                    }
                    Text("\(startTime.formatted(date: .omitted, time: .shortened))")
                }
                .padding(4)
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
        .padding(12)
        .cornerRadius(12.0)
        .background(Color(.systemBackground))
    }
}

struct SleepCardView_Previews: PreviewProvider {
    static var previews: some View {
        SleepCardView(isNight: true, startTime: .now, endTime: .now.addingTimeInterval(3900))
            .background(Color(.secondaryBackground))
            .previewLayout(.fixed(width: 400, height: 150))
            .environmentObject(RealmManager())
    }
}
