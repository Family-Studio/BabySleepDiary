//
//  BabySleepDiaryApp.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI

@main
struct BabySleepDiaryApp: App {
    init() {
        @Binding var isNight: Bool
        @Binding var startTime: Date?
        @Binding var endTime: Date?
    }
    
    @StateObject private var store = SleepStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            NavigationView {

            }
        }
    }
}
