//
//  BabySleepDiaryApp.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 22.10.2022.
//

import SwiftUI

@main
struct BabySleepDiaryApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path(percentEncoded: true))
                SleepsView()
            }
        }
    }
}
