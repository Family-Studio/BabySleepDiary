//
//  Person.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 08/06/2023.
//

import Foundation
import RealmSwift

class Baby: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = "Guest"
    @Persisted var isBoy: Bool = false
    @Persisted var birthday: Date? = Date()
    @Persisted var sleeps: List<Sleep>
}

