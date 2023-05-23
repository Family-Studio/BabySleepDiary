//
//  BabySleepDiaryApp.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI

@main
struct BabySleepDiaryApp: App {
    @StateObject private var store = SleepStore()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SleepsView(sleeps: $store.sleeps) {
                    Task {
                        do {
                            try await store.save(sleeps: store.sleeps)
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
                    .task {
                        do {
                            try await store.load()
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
            }
        }
    }
}
