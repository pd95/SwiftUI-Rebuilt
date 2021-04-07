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
        if let currentSong = playerState.currentSong {
            MiniAudioPlayer(currentlyPlaying: currentSong)
                .background(
                    Color(.quaternarySystemFill)
                        .background(VisualEffectView(effect: UIBlurEffect(style: .systemMaterial)))
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture(perform: toggleMiniPlayer)
                )
                .frame(maxHeight: .infinity, alignment: .bottom)
                .transition(.opacity)
                .fullScreenCover(isPresented: $playerState.fullscreenPlayer, content: {
                    SheetAudioPlayer(currentlyPlaying: currentSong)
                        .background(
                            Color(.quaternarySystemFill)
                                .background(VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial)))
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture(perform: toggleMiniPlayer)
                        )
                        .environmentObject(playerState)
                })
        }
    }

    func toggleMiniPlayer() {
        print("toggleMiniPlayer")
        withAnimation {
            playerState.toggleMiniPlayer()
        }
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
