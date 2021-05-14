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

            AudioPlayerButton(symbol: playerState.playPauseSymbol,
                              action: playerState.togglePlayPause)
                .imageScale(.large)

            AudioPlayerButton(symbol: .forward, action: {})
                .imageScale(.large)
                .disabled(!playerState.hasNext)
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
