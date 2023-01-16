//
//  Theme.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 16/01/2023.
//

import SwiftUI

enum Theme: String {
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
        case .bubblegum, .happy, .sky, .spring: return .white
        case .navy, .pink, .tial, .white: return .black
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
}
