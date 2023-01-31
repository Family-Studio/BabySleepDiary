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
    var theme: Theme
    var sleepDuration: String
    var wakeDuration: String
    var wakeDurationIcon: String = "clock.arrow.circlepath"
    
    
    init(id: UUID = UUID(), startTime: String, endTime: String, dayOrNightSleep: String, dayOrNightIcon: String, theme: Theme, sleepDuration: String, wakeDuration: String, wakeDurationIcon: String = "clock.arrow.circlepath") {
        self.id = id
        self.startTime = startTime
        self.endTime = endTime
        self.dayOrNightSleep = dayOrNightSleep
        self.dayOrNightIcon = dayOrNightIcon
        self.theme = theme
        self.sleepDuration = sleepDuration
        self.wakeDuration = wakeDuration
        self.wakeDurationIcon = wakeDurationIcon
    }
}

extension SleepLog {
    
    struct Data {
        var startTime: String = ""
        var endTime: String = ""
        var dayOrNightSleep: String = ""
    }
    
    var data: Data {
        Data(startTime: startTime, endTime: endTime, dayOrNightSleep: dayOrNightSleep)
    }
    
    static let sleeps: [SleepLog] =
    [
        SleepLog(startTime: "22:08", endTime: "08:00", dayOrNightSleep: "Night", dayOrNightIcon: "moon.stars.fill", theme: Theme.sky, sleepDuration: "9 hours 52 minutes", wakeDuration: "5 hours 59 minutes"),
        SleepLog(startTime: "13:59", endTime: "16:40", dayOrNightSleep: "Day", dayOrNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeDuration: "5 hours 3 minutes"),
        SleepLog(startTime: "13:59", endTime: "16:40", dayOrNightSleep: "Day", dayOrNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeDuration: "5 hours 3 minutes"),
        SleepLog(startTime: "13:59", endTime: "16:40", dayOrNightSleep: "Day", dayOrNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeDuration: "5 hours 3 minutes"),
        SleepLog(startTime: "13:59", endTime: "16:40", dayOrNightSleep: "Day", dayOrNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeDuration: "5 hours 3 minutes"),
        SleepLog(startTime: "13:59", endTime: "16:40", dayOrNightSleep: "Day", dayOrNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeDuration: "5 hours 3 minutes"),
        SleepLog(startTime: "13:59", endTime: "16:40", dayOrNightSleep: "Day", dayOrNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeDuration: "5 hours 3 minutes")
    ]
}
