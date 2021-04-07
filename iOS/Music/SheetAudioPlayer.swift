//
//  SheetAudioPlayer.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 07.04.21.
//

import SwiftUI

struct SheetAudioPlayer: View {
    @EnvironmentObject var playerState: AudioPlayerViewModel

    let currentlyPlaying: PlayingSong
    

    var body: some View {
        VStack {

            Button(action: playerState.toggleMiniPlayer) {
                Image(systemName: "minus")
                    .imageScale(.large)
                    .frame(minWidth: 40, minHeight: 40)
                    .font(.system(size: 40, weight: .medium))
                    .foregroundColor(.secondary)
            }

            Image(currentlyPlaying.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding()

            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(currentlyPlaying.song)
                        .font(.headline)
                    Text(currentlyPlaying.singer)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {}) {
                    Image(systemName: "ellipsis.circle.fill")
                        .renderingMode(.original)
                        .imageScale(.large)
                        .frame(minWidth: 40, minHeight: 40)
                }
            }
            .padding()

            Spacer()

            HStack(spacing: 60) {
                Button(action: {}) {
                    Image(systemName: "backward.fill")
                        .renderingMode(.original)
                        .imageScale(.large)
                        .frame(minWidth: 40, minHeight: 40)
                        .font(.title)
                }
                
                Button(action: playerState.togglePlayPause) {
                    Image(systemName: playerState.playing ? "pause.fill" : "play.fill")
                        .renderingMode(.original)
                        .imageScale(.large)
                        .frame(minWidth: 50, minHeight: 50)
                        .aspectRatio(contentMode: .fill)
                        .font(.largeTitle)
                }
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                        .renderingMode(.original)
                        .imageScale(.large)
                        .frame(minWidth: 40, minHeight: 40)
                        .font(.title)
                }
            }
            .padding()

            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SheetAudioPlayer_Previews: PreviewProvider {
    static var previews: some View {
        SheetAudioPlayer(currentlyPlaying: .example)
            .environmentObject(AudioPlayerViewModel(song: .example, fullscreenPlayer: true))
    }
}
