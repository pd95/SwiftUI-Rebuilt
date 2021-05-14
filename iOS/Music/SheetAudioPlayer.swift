//
//  SheetAudioPlayer.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 07.04.21.
//

import SwiftUI

struct SheetAudioPlayer: View {
    @EnvironmentObject var playerState: AudioPlayerViewModel

    var positionBinding: Binding<Double> {
        .init(get: {
            playerState.position
        }, set: { newValue in
            playerState.scrub(to: newValue)
        })
    }
    
    var positionRange: ClosedRange<Double> {
        0...(playerState.currentSong?.duration ?? 0)
    }
    
    var audioLevelBinding: Binding<Double> {
        .init(get: {
            playerState.audioLevel
        }, set: { newValue in
            playerState.setVolume(to: newValue)
        })
    }
    
    var body: some View {
        VStack {
            Button(action: playerState.toggleMiniPlayer) {
                Image(systemName: "minus")
                    .imageScale(.large)
                    .frame(minWidth: 40, minHeight: 40)
                    .font(.system(size: 40, weight: .medium))
                    .foregroundColor(.secondary)
            }

            Image(playerState.currentSongImageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding()
                .shadow(radius: 20)

            Spacer()
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(playerState.currentSongTitle)
                            .font(.headline)
                        Text(playerState.currentSongSubtitle)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    AudioPlayerButton(symbol: .ellipsis, action: {})
                        .font(.title)
                        .foregroundColor(.secondary)
                        .opacity(playerState.currentSong == nil ? 0 : 1)
                }

                Spacer()

                // Position slider
                VStack {
                    Slider(value: positionBinding, in: positionRange)
                    HStack {
                        Text(playerState.positionString)
                        Spacer()
                        Text(playerState.timeLeftString)
                    }
                }

                Spacer()

                // Position slider
                HStack(spacing: 50) {
                    AudioPlayerButton(symbol: .backward, action: {})
                        .font(.title2)
                        .disabled(!playerState.hasPrevious)
                    
                    AudioPlayerButton(symbol: playerState.playPauseSymbol, action: playerState.togglePlayPause)
                        .font(.largeTitle)
                    
                    AudioPlayerButton(symbol: .forward, action: {})
                        .font(.title2)
                        .disabled(!playerState.hasNext)
                }
                .imageScale(.large)

                Spacer()

                // Volume slider
                VStack {
                    Slider(value: audioLevelBinding, in: 0.0...1.0,
                           minimumValueLabel: SFSymbol.volumeLow.image,
                           maximumValueLabel: SFSymbol.volumeHigh.image,
                           label: { EmptyView() })
                }
                .imageScale(.small)

                Spacer()
                
                // Mode buttons
                HStack(spacing: 60) {
                    AudioPlayerButton(symbol: .songText, action: {})
                    AudioPlayerButton(symbol: .airplay, action: {})
                    AudioPlayerButton(symbol: .playlist, action: {})
                }
                .imageScale(.large)
                .font(.headline)
            }
            .padding()
        }
        .accentColor(.primary)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

struct SheetAudioPlayer_Previews: PreviewProvider {
    static let song: Song? = Song.mySong(for: "Photograph")
    static var previews: some View {
        SheetAudioPlayer()
            .environmentObject(AudioPlayerViewModel(song: song, fullscreenPlayer: true))
    }
}
