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
                    
                    Button(action: {}) {
                        Image(systemName: "ellipsis.circle.fill")
                            .font(.title)
                            .frame(minWidth: 40, minHeight: 40)
                    }
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
                HStack(spacing: 60) {
                    Button(action: {}) {
                        Image(systemName: "backward.fill")
                            .frame(minWidth: 40, minHeight: 40)
                            .font(.title)
                    }
                    
                    Button(action: playerState.togglePlayPause) {
                        Image(systemName: playerState.playing ? "pause.fill" : "play.fill")
                            .frame(minWidth: 50, minHeight: 50)
                            .aspectRatio(contentMode: .fill)
                            .font(.largeTitle)
                    }
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                            .frame(minWidth: 40, minHeight: 40)
                            .font(.title)
                    }
                }
                .imageScale(.large)

                Spacer()

                // Volume slider
                VStack {
                    Slider(value: audioLevelBinding, in: 0.0...1.0, minimumValueLabel: Image(systemName: "speaker.fill"), maximumValueLabel: Image(systemName: "speaker.wave.3.fill"), label: { EmptyView() })
                }
                .imageScale(.small)

                Spacer()
                
                // Mode buttons
                HStack(spacing: 60) {
                    Button(action: {}, label: {
                        Image(systemName: "quote.bubble")
                            .frame(minWidth: 40, minHeight: 40)
                    })
                    Button(action: {}, label: {
                        Image(systemName: "airplayaudio")
                            .frame(minWidth: 40, minHeight: 40)
                    })
                    Button(action: {}, label: {
                        Image(systemName: "list.bullet")
                            .frame(minWidth: 40, minHeight: 40)
                    })
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
