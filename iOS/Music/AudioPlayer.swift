//
//  AudioPlayer.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 07.04.21.
//

import SwiftUI

struct AudioPlayer: View {
    @EnvironmentObject var playerState: AudioPlayerViewModel
    
    @Namespace var namespace

    var body: some View {
        MiniAudioPlayer()
            .frame(maxHeight: .infinity, alignment: .bottom)
            .transition(.opacity)
            .fullScreenCover(isPresented: $playerState.fullscreenPlayer, content: {
                    SheetAudioPlayer()
                        .environmentObject(playerState)
                })
    }
}

struct AudioPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayer()
            .environmentObject(AudioPlayerViewModel(song: .example, fullscreenPlayer: false))
        AudioPlayer()
            .environmentObject(AudioPlayerViewModel(song: .example, fullscreenPlayer: true))
    }
}
