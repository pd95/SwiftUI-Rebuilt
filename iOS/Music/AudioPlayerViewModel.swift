//
//  AudioPlayerViewModel.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 07.04.21.
//

import SwiftUI

class AudioPlayerViewModel: ObservableObject {

    @Published private(set) var currentSong: Song? = nil
    @Published private(set) var playing: Bool = false
    @Published private(set) var position: Double = 0
    @Published var audioLevel: Double = 0.42
    @Published var fullscreenPlayer: Bool = false
    
    
    init(song: Song? = nil, playing: Bool = false, fullscreenPlayer: Bool = false) {
        _currentSong = Published(initialValue: song)
        _playing = Published(initialValue: playing)
        _fullscreenPlayer = Published(initialValue: fullscreenPlayer)
    }
    
    func playSong(_ song: Song?) {
        withAnimation {
            currentSong = song
            if song != nil {
                fullscreenPlayer = false
            }
            playing = true
            position = 0
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
