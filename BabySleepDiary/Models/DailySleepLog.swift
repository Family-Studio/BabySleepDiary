//
//  SleepLog.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 17/01/2023.
//

import Foundation


struct DailySleepLog {
    var startTime: String
    var endTime: String
    var isNithtSleep: String
    var dayAndNightIcon: String
    var theme: Theme
    var sleepDuration: String
    var wakeTime: String
    var wakefulnessurationIcon: String = "clock.arrow.circlepath"
    
}

extension DailySleepLog {
    static let sleeps: [DailySleepLog] =
    [
        DailySleepLog(startTime: "22:08", endTime: "08:00", isNithtSleep: "Night", dayAndNightIcon: "moon.stars.fill", theme: Theme.sky, sleepDuration: "9 hours 52 minutes", wakeTime: "5 hours 59 minutes"),
        DailySleepLog(startTime: "13:59", endTime: "16:40", isNithtSleep: "Day", dayAndNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeTime: "5 hours 3 minutes"),
        DailySleepLog(startTime: "13:59", endTime: "16:40", isNithtSleep: "Day", dayAndNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeTime: "5 hours 3 minutes"),
        DailySleepLog(startTime: "13:59", endTime: "16:40", isNithtSleep: "Day", dayAndNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeTime: "5 hours 3 minutes"),
        DailySleepLog(startTime: "13:59", endTime: "16:40", isNithtSleep: "Day", dayAndNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeTime: "5 hours 3 minutes"),
        DailySleepLog(startTime: "13:59", endTime: "16:40", isNithtSleep: "Day", dayAndNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeTime: "5 hours 3 minutes"),
        DailySleepLog(startTime: "13:59", endTime: "16:40", isNithtSleep: "Day", dayAndNightIcon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakeTime: "5 hours 3 minutes")
    ]
}
