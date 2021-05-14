//
//  AudioPlayerViewModel.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 07.04.21.
//

import SwiftUI
import Combine

class AudioPlayerViewModel: ObservableObject {

    @Published private(set) var currentSong: Song? = nil
    @Published private(set) var playing: Bool = false
    @Published private(set) var position: Double = 0
    @Published private(set) var audioLevel: Double = 0.42
    @Published var fullscreenPlayer: Bool = false
    
    var timeLeft: Double {
        position - (currentSong?.duration ?? 0)
    }
    
    var cancellable: AnyCancellable?
    
    init(song: Song? = nil, playing: Bool = false, fullscreenPlayer: Bool = false) {
        _currentSong = Published(initialValue: song)
        _playing = Published(initialValue: playing)
        _fullscreenPlayer = Published(initialValue: fullscreenPlayer)

        // Install timer
        cancellable = Timer.publish(every: 1, on: RunLoop.main, in: .default).autoconnect()
            .combineLatest($playing)
            .sink { [weak self] (_, playing) in
                guard let self = self, playing else { return }
                self.objectWillChange.send()
                self.position += 1
                let maxDuration = self.currentSong?.duration ?? 0
                if self.position >= maxDuration {
                    self.playing = false
                    self.position = maxDuration
                }
            }
    }
    
    func playSong(_ song: Song?) {
        withAnimation {
            currentSong = song
            if song != nil {
                fullscreenPlayer = false
                playing = true
                position = 0
            }
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
    
    func scrub(to newPosition: Double) {
        position = newPosition
    }
    
    func setVolume(to value: Double) {
        audioLevel = value
    }
}
