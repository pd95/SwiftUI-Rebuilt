//
//  SFSymbol.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 14.05.21.
//

import SwiftUI

enum SFSymbol: String {
    case play = "play.fill"
    case pause = "pause.fill"
    case forward = "forward.fill"
    case backward = "backward.fill"
    case volumeLow = "speaker.fill"
    case volumeHigh = "speaker.wave.3.fill"
    case songText = "quote.bubble"
    case airplay = "airplayaudio"
    case playlist = "list.bullet"
    case ellipsis = "ellipsis.circle.fill"
    case user = "person.crop.circle"

    var imageName: String {
        rawValue
    }
    
    var image: Image {
        Image(systemName: rawValue)
    }
}

