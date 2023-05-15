//
//  SleepStore.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 11/05/2023.
//

import SwiftUI

class SleepStore: ObservableObject {
    @Published var sleeps: [DailySleep] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("sleeps.data")
    }
    
}
