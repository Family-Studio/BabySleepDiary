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
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SleepsView(sleeps: $store.sleeps) {
                    Task {
                        do {
                            try await store.save(sleeps: store.sleeps)
                        } catch {
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                        }
                    }
                }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "BabySleepDiary will load sample data and continue.")
                    }
                }
                .sheet(item: $errorWrapper) {
                    store.sleeps = DailySleep.sleeps
                } content: { wrapper in
                    ErrorView(errorWrapper: wrapper)
                }
            }
        }
    }
}
