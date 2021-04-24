//
//  FeaturePick.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 24.04.21.
//

import Foundation
import SwiftUI

struct FeaturePick: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let text: String?
    let color: Color
    let imageName: String
    let item: PlayableItem
}

extension FeaturePick {
    // Implement Equatable (without item)
    static func == (lhs: FeaturePick, rhs: FeaturePick) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title && lhs.subtitle == rhs.subtitle && lhs.text == rhs.text && lhs.color == rhs.color && lhs.imageName == rhs.imageName
    }
    
    // Implement Hashable (without item)
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(subtitle)
        hasher.combine(text)
        hasher.combine(color)
        hasher.combine(imageName)
    }
}
