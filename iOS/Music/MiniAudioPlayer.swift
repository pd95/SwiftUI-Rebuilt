//
//  MiniAudioPlayer.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 06.04.21.
//

import SwiftUI

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

struct MiniAudioPlayer: View {
    let currentlyPlaying: PlayingSong
    
    var body: some View {
        HStack {
            Image(currentlyPlaying.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.vertical, 8)
                .padding(.leading, 4)
                .padding(.trailing, 6)

            Text(currentlyPlaying.song)
                .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: {}) {
                Image(systemName: "play.fill")
                    .renderingMode(.original)
                    .imageScale(.large)
                    .frame(minWidth: 40, minHeight: 40)
            }
            Button(action: {}) {
                Image(systemName: "forward.fill")
                    .renderingMode(.original)
                    .imageScale(.large)
                    .frame(minWidth: 40, minHeight: 40)
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: 64)
        .background(
            Color(.quaternarySystemFill)
                .background(VisualEffectView(effect: UIBlurEffect(style: .systemMaterial)))
        )
    }
}

struct MiniAudioPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniAudioPlayer(currentlyPlaying: .example)
    }
}
