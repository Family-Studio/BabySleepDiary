//
//  Sleep.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 07/06/2023.
//

import Foundation
import RealmSwift

class Sleep: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var isNight: Bool
    @Persisted var startTime: Date?
    @Persisted var endTime: Date?
    @Persisted var baby: Baby?
    
    func calculateDuration(startTime: Date?, endTime: Date?) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: startTime ?? .now, to: endTime ?? .now)
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        
        return "\(hours) hours \(minutes) minutes"
    }
}
