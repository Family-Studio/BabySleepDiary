//
//  SleepLog.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 17/01/2023.
//

import Foundation


struct SleepLog: Identifiable {
    let id: UUID
    var startTime: String
    var endTime: String
    var dayOrNightSleep: String
    var dayOrNightIcon: String
    var sleepDuration: String
    var wakeDuration: String
    var wakeDurationIcon: String
    var theme: Theme
    
    
    init(id: UUID = UUID(), startTime: String, endTime: String, dayOrNightSleep: String, dayOrNightIcon: String, sleepDuration: String, wakeDuration: String, wakeDurationIcon: String = "clock.arrow.circlepath", theme: Theme) {
        self.id = id
        self.startTime = startTime
        self.endTime = endTime
        self.dayOrNightSleep = dayOrNightSleep
        self.dayOrNightIcon = dayOrNightIcon
        self.sleepDuration = sleepDuration
        self.wakeDuration = wakeDuration
        self.wakeDurationIcon = wakeDurationIcon
        self.theme = theme
    }
}

extension SleepLog {
    static var emptySleep = SleepLog(startTime: "00:00", endTime: "00:00", dayOrNightSleep: "N/a", dayOrNightIcon: "questionmark.diamond", sleepDuration: "0 hours 0 minutes", wakeDuration: "0 hours 0 minutes", theme: Theme.bubblegum)
}

extension SleepLog {
    static let sleeps: [SleepLog] =
    [
        SleepLog(startTime: "22:08", endTime: "08:00", dayOrNightSleep: "Night", dayOrNightIcon: "moon.stars.fill", sleepDuration: "9 hours 52 minutes", wakeDuration: "5 hours 59 minutes", theme: Theme.sky),
        SleepLog(startTime: "13:59", endTime: "16:40", dayOrNightSleep: "Day", dayOrNightIcon: "sun.max.fill", sleepDuration: "5 hours 59 minutes", wakeDuration: "5 hours 3 minutes", theme: Theme.happy),
        SleepLog(startTime: "13:59", endTime: "16:40", dayOrNightSleep: "Day", dayOrNightIcon: "sun.max.fill", sleepDuration: "5 hours 59 minutes", wakeDuration: "5 hours 3 minutes", theme: Theme.happy)
    ]
}
