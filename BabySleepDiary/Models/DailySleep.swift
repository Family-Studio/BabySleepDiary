//
//  SleepLog.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 17/01/2023.
//

import Foundation


struct DailySleep: Identifiable, Codable {
    let id: UUID
    var startTime: String
    var endTime: String
    var dayOrNightSleep: String
    var dayOrNightIcon: String
    var sleepDuration: String
    var wakeDuration: String
    var wakeDurationIcon: String
    
    
    init(id: UUID = UUID(), startTime: String, endTime: String, dayOrNightSleep: String, dayOrNightIcon: String, sleepDuration: String, wakeDuration: String, wakeDurationIcon: String = "clock.arrow.circlepath") {
        self.id = id
        self.startTime = startTime
        self.endTime = endTime
        self.dayOrNightSleep = dayOrNightSleep
        self.dayOrNightIcon = dayOrNightIcon
        self.sleepDuration = sleepDuration
        self.wakeDuration = wakeDuration
        self.wakeDurationIcon = wakeDurationIcon
    }
}

extension DailySleep {
    static var emptySleep = DailySleep(startTime: "00:00", endTime: "00:00", dayOrNightSleep: "N/a", dayOrNightIcon: "questionmark.diamond", sleepDuration: "0 hours 0 minutes", wakeDuration: "0 hours 0 minutes")
}

extension DailySleep {
    static let sleeps: [DailySleep] =
    [
        DailySleep(startTime: "22:08", endTime: "08:00", dayOrNightSleep: "Night", dayOrNightIcon: "moon.stars.fill", sleepDuration: "9 hours 52 minutes", wakeDuration: "5 hours 59 minutes"),
        DailySleep(startTime: "13:59", endTime: "16:40", dayOrNightSleep: "Day", dayOrNightIcon: "sun.max.fill", sleepDuration: "5 hours 59 minutes", wakeDuration: "5 hours 3 minutes"),
        DailySleep(startTime: "13:59", endTime: "16:40", dayOrNightSleep: "Day", dayOrNightIcon: "sun.max.fill", sleepDuration: "5 hours 59 minutes", wakeDuration: "5 hours 3 minutes")
    ]
}
