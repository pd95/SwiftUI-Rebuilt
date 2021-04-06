//
//  VisualEffectView.swift
//  Shared
//
//  Created by Philipp on 06.04.21.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    typealias UIViewType = UIVisualEffectView
    
    var effect: UIVisualEffect
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return .init(effect: effect)
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}
