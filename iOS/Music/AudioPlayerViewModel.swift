//
//  AudioPlayerViewModel.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 07.04.21.
//

import SwiftUI

class AudioPlayerViewModel: ObservableObject {

    @Published private(set) var currentSong: PlayingSong?
    @Published private(set) var playing: Bool
    @Published var fullscreenPlayer: Bool
    
    init(song: PlayingSong? = nil, playing: Bool = false, fullscreenPlayer: Bool = false) {
        _currentSong = Published(initialValue: song)
        _playing = Published(initialValue: playing)
        _fullscreenPlayer = Published(initialValue: fullscreenPlayer)
    }
    
    func playSong(_ song: PlayingSong?) {
        withAnimation {
            currentSong = song
            if song != nil {
                fullscreenPlayer = false
            }
            playing = true
        }
    }
    
    func togglePlayPause() {
        playing.toggle()
    }

    func toggleMiniPlayer() {
        withAnimation {
            fullscreenPlayer.toggle()
        }
    }
}
