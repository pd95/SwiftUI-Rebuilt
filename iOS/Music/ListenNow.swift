//
//  ListenNow.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 18.03.21.
//

import SwiftUI

struct ListenNow: View {
    @EnvironmentObject var audioPlayer: AudioPlayerViewModel

    @State private var navBarTitle: String = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 8) {
                    HStack {
                        Text("Listen Now")
                            .font(.largeTitle)
                            .bold()
                            // Track position of "Listen Now" to learn when to show the navigation bar
                            .background(GeometryReader { proxy -> Color in
                                let yOffset = proxy.frame(in: .global).minY
                                let newTitle = yOffset <= 50 ? "Listen Now" : ""
                                if navBarTitle != newTitle {
                                    navBarTitle = newTitle
                                }
                                return Color.clear
                            })

                        Spacer()

                        Button(action: {}, label: {
                            Image(systemName: "person.crop.circle")
                                .imageScale(.large)
                                .font(Font.title.weight(.medium))
                        })
                    }
                    .padding(.top, 48)
                    .padding(.bottom, 8)
                    .background(
                        Divider()
                            .background(Color.secondary)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 2)

                    topPicksHScroller
                    
                    recentlyPlayedHScroller

                    if audioPlayer.currentSong != nil {
                        Spacer(minLength: 40)
                            .layoutPriority(-1)
                    }
                }
            }
            .overlay(
                AudioPlayer()
            )

            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(navBarTitle)
            .navigationBarHidden(navBarTitle.isEmpty)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var topPicksHScroller: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Top Picks")
                .font(.title2)
                .bold()
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(FeaturePick.topPicks) { pick in
                        FeatureCard(pick)
                            .onTapGesture(perform: {
                                playSong(pick.firstSong)
                            })
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }

    var recentlyPlayedHScroller: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Recently Played")
                    .font(.title2)
                    .bold()
                Spacer()
                Button("See All", action: {})
            }
            .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(Playlist.recentlyPlayed, id: \.id) { item in
                        AlbumCard(item)
                            .onTapGesture(perform: {
                                playSong(item)
                            })
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .padding(.vertical, 14)
    }

    func playSong(_ item: PlayableItem) {
        audioPlayer.playSong(audioPlayer.currentSong == nil ? item.firstSong : nil)
    }
}

struct ListenNow_Previews: PreviewProvider {
    static var previews: some View {
        ListenNow()
            .environmentObject(AudioPlayerViewModel(song: .example, fullscreenPlayer: false))
    }
}
