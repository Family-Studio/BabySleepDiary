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
    @Persisted var baby: Baby
}
