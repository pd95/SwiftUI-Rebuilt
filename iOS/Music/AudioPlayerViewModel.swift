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
    
    // MARK: View state information
    
    var currentSongImageName: String {
        currentSong?.imageName ?? "albumPlaceholder"
    }

    var currentSongTitle: String {
        currentSong?.title ?? "Not Playing"
    }

    var currentSongSubtitle: String {
        currentSong?.artist.title ?? ""
    }

    var positionString: String {
        durationString(from: Int(position))
    }
    
    var timeLeftString: String {
        durationString(from: Int(position - (currentSong?.duration ?? 0)))
    }

    // MARK: - Handle interactions
    
    // Request playing this song
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

    // MARK: - Private helper methods interactions
    private func durationString(from interval: Int) -> String {
        if currentSong == nil {
            return "--:--"
        }
        if interval == 0 {
            return "0:00"
        }
        
        var string = interval < 0 ? "-" : ""
        let absInterval = abs(interval)
        let seconds = absInterval % 60
        let minutes = Int(absInterval / 60)

        string += String(minutes)
        string += ":"
        if seconds < 10 {
            string += "0"
        }
        string += String(seconds)
        return string
    }
}
