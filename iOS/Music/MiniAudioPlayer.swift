//
//  MiniAudioPlayer.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 06.04.21.
//

import SwiftUI

struct MiniAudioPlayer: View {
    let currentlyPlaying: PlayingSong
    let toggleMiniPlayer: () -> Void

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
        .onTapGesture(perform: toggleMiniPlayer)
    }
}

struct MiniAudioPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniAudioPlayer(currentlyPlaying: .example,toggleMiniPlayer: {})
    }
}
