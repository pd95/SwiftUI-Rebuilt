//
//  PlayerButton.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 14.05.21.
//

import SwiftUI

struct AudioPlayerButton: View {
    
    let symbol: SFSymbol
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: symbol.rawValue)
                .frame(minWidth: 40, minHeight: 40)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct PlayerButton_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            AudioPlayerButton(symbol: .play, action: {})
                .font(.title)
                .previewLayout(.fixed(width: 60, height: 60))
            AudioPlayerButton(symbol: .forward, action: {})
                .font(.title)
                .disabled(true)
                .previewLayout(.fixed(width: 60, height: 60))
            AudioPlayerButton(symbol: .ellipsis, action: {})
                .font(.title)
                .foregroundColor(.secondary)
                .previewLayout(.fixed(width: 60, height: 60))
        }
    }
}
