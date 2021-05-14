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
                            SFSymbol.user.image
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
                    
                    playableItemHScroller(title: "Recently Played", items: Playlist.recentlyPlayed)

                    // List of albums for each genre
                    ForEach(Array(Set(Album.all.values.map(\.genre))).sorted(), id: \.self) { genre in
                        Divider()
                            .padding(.horizontal, 20)
                            .padding(.vertical, 6)
                        playableItemHScroller(title: genre, items: Album.all.values.filter({ $0.genre == genre }).sorted(by: { $0.title < $1.title }))
                    }

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

    func playableItemHScroller(title: String, items: [PlayableItem]) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(title)
                    .font(.title2)
                    .bold()
                Spacer()
                Button("See All", action: {})
                    .opacity(items.count > 8 ? 1 : 0)
            }
            .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(items.prefix(8), id: \.id) { item in
                        AlbumCard(item)
                            .frame(maxHeight: .infinity)
                            .onTapGesture(perform: {
                                playSong(item)
                            })
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }

    func playSong(_ item: PlayableItem) {
        if audioPlayer.currentSong != item.firstSong {
            audioPlayer.playSong(item.firstSong)
        }
    }
}

struct ListenNow_Previews: PreviewProvider {
    static var previews: some View {
        ListenNow()
            .environmentObject(AudioPlayerViewModel(song: .example, fullscreenPlayer: false))
    }
}
