//
//  MiniAudioPlayer.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 06.04.21.
//

import SwiftUI

struct MiniAudioPlayer: View {
    @EnvironmentObject var playerState: AudioPlayerViewModel

    var body: some View {
        HStack {
            Image(playerState.currentSongImageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.vertical, 8)
                .padding(.leading, 4)
                .padding(.trailing, 6)

            Text(playerState.currentSongTitle)
                .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: playerState.togglePlayPause) {
                Image(systemName: playerState.playing ? "pause.fill" : "play.fill")
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
        .contentShape(Rectangle())
        .onTapGesture(perform: playerState.toggleMiniPlayer)
    }
}

struct MiniAudioPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniAudioPlayer()
            .environmentObject(AudioPlayerViewModel(song: .example, fullscreenPlayer: false))
    }
}
