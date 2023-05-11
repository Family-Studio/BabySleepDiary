//
//  SleepStore.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 11/05/2023.
//

import SwiftUI

class SleepStore: ObservableObject {
    @Published var sleeps: [DailySleep] = []
    
}
