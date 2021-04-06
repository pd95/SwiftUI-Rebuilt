//
//  MusicAppDataModel.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 06.04.21.
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
    
    static let topPicks: [FeaturePick] = [
        FeaturePick(title: "Featuring Alan Walker", subtitle: "Alan Walker & Similar Artists\nStation", text: nil, color: Color(#colorLiteral(red: 0.1098039216, green: 0.1568734348, blue: 0.1333114803, alpha: 1)), imageName: "AlanWalker"),
        FeaturePick(title: "Take a Load Off", subtitle: "Acoustic Hits", text: "Pop hits stripped to their bare,\nbeautiful essentials.", color: Color(#colorLiteral(red: 0.7372552752, green: 0.3804122806, blue: 0.2196018994, alpha: 1)), imageName: "AcousticHits"),
        FeaturePick(title: "Featuring Bruno Mars", subtitle: "Pure Romance", text: "Sparks fly in our all-time\nfavourite love songs.", color: Color(#colorLiteral(red: 0.7882060409, green: 0.6078792214, blue: 0.6469835639, alpha: 1)), imageName: "PureRomance"),
    ]
}


struct Album: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let artitst: String?
    let curator: String?
    let imageName: String
    
    init(title: String, artitst: String? = nil, curator: String? = nil, imageName: String) {
        self.title = title
        self.artitst = artitst
        self.curator = curator
        self.imageName = imageName
    }
    
    var subtitle: String {
        artitst ?? curator ?? "-"
    }
    
    static let recentlyPlayed: [Album] = [
        Album(title: "On n'a qu'une terre - Single", artitst: "Stress", imageName: "OnNAQuUneTerre"),
        Album(title: "2010s Hits Essentials", curator: "10s", imageName: "2010sHits"),
        Album(title: "Acoustic Hits", curator: "Apple Music Pop", imageName: "AcousticHits"),
        Album(title: "Pure Romance", curator: "Apple Music Pop", imageName: "PureRomance"),
    ]
}


struct PlayingSong {
    let song: String
    let album: String
    let singer: String
    let position: Double
    let duration: Double
    let audioLevel: Double
    let imageName: String

    static let example = PlayingSong(song: "On n'a qu'une terre", album: "On n'a qu'une terre - Single", singer: "Stress", position: 21, duration: 188, audioLevel: 0.3, imageName: "OnNAQuUneTerre")
}
