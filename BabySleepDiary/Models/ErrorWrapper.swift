//
//  ErrorWrapper.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 23/05/2023.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
