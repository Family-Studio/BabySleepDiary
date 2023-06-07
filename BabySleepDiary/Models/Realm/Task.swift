//
//  Task.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 07/06/2023.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
}
