//
//  Theme.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 16/01/2023.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    case bubblegum
    case happy
    case navy
    case pink
    case sky
    case spring
    case tial
    case white
    
    var accentColor: Color {
        switch self {
        case .navy, .pink, .tial: return .white
        case .bubblegum, .happy, .sky, .spring, .white: return .black
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}
