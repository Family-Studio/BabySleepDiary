//
//  BabySleepDiaryApp.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI

@main
struct BabySleepDiaryApp: App {
    @State private var sleeps = DailySleep.sleeps
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SleepLogView(sleeps: $sleeps)
            }
        }
    }
}
