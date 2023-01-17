//
//  SleepLog.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 17/01/2023.
//

import Foundation


struct SleepLog {
    var startTime: String
    var endTime: String
    var isNithtSleep: String
    var sleepDuration: String
    var wakefulnessuration: String
}

extension SleepLog {
    static let sleeps: [SleepLog] =
    [
        SleepLog(startTime: "22:08", endTime: "08:00", isNithtSleep: "Night", sleepDuration: "9 hours 52 minutes", wakefulnessuration: "5 hours 59 minutes"),
        SleepLog(startTime: "13:59", endTime: "16:40", isNithtSleep: "Day", sleepDuration: "5 hours 59 minutes", wakefulnessuration: "5 hours 3 minutes")
    ]
}
