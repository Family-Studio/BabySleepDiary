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
    var icon: String
    var theme: Theme
    var sleepDuration: String
    var wakefulnessuration: String
    
}

extension DailySleepLog {
    static let sleeps: [DailySleepLog] =
    [
        DailySleepLog(startTime: "22:08", endTime: "08:00", isNithtSleep: "Night", icon: "moon.stars.fill", theme: Theme.sky, sleepDuration: "9 hours 52 minutes", wakefulnessuration: "5 hours 59 minutes"),
        DailySleepLog(startTime: "13:59", endTime: "16:40", isNithtSleep: "Day", icon: "sun.max.fill", theme: Theme.happy, sleepDuration: "5 hours 59 minutes", wakefulnessuration: "5 hours 3 minutes")
    ]
}
