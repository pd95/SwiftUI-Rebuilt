//
//  AudioPlayer.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 07.04.21.
//

import SwiftUI

struct AudioPlayer: View {
    let currentlyPlaying: PlayingSong
    @Binding var showMiniPlayer: Bool

    @Namespace var namespace

    var body: some View {
        if showMiniPlayer {
            MiniAudioPlayer(currentlyPlaying: currentlyPlaying, toggleMiniPlayer: toggleMiniPlayer)
                .background(
                    Color(.quaternarySystemFill)
                        .background(VisualEffectView(effect: UIBlurEffect(style: .systemMaterial)))
                        .edgesIgnoringSafeArea(.all)
                )
                .frame(maxHeight: .infinity, alignment: .bottom)
                .transition(.opacity)
        }
        else {
            SheetAudioPlayer(currentlyPlaying: currentlyPlaying, toggleMiniPlayer: toggleMiniPlayer)
                .background(
                    Color(.quaternarySystemFill)
                        .background(VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial)))
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture(perform: toggleMiniPlayer)
                )
                .transition(.move(edge: .bottom))
        }
    }

    func toggleMiniPlayer() {
        print("toggleMiniPlayer")
        withAnimation {
            showMiniPlayer.toggle()
        }
    }
}

struct AudioPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayer(currentlyPlaying: .example, showMiniPlayer: .constant(false))
        AudioPlayer(currentlyPlaying: .example, showMiniPlayer: .constant(true))
    }
}
