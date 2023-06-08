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
    @Persisted var name: String
    @Persisted var sex: Bool
    @Persisted var birthday: Date?
    @Persisted var sleeps: List<Sleep>
}
