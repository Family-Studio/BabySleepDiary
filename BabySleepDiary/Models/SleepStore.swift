//
//  SleepStore.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 11/05/2023.
//

import SwiftUI

@MainActor
class SleepStore: ObservableObject {
    @Published var sleeps: [DailySleep] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("sleeps.data")
    }
    
    func load() async throws {
        let task = Task<[DailySleep], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let dailySleeps = try JSONDecoder().decode([DailySleep].self, from: data)
            return dailySleeps
        }
        let sleeps = try await task.value
        self.sleeps = sleeps
    }
}
