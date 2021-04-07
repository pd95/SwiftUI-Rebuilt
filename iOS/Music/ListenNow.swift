//
//  ListenNow.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 18.03.21.
//

import SwiftUI

struct ListenNow: View {
    @State private var navBarTitle: String = ""
    @State private var currentlyPlaying: PlayingSong? = .example
    @State private var showingMiniPlayer = true
    
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

                    topPicks
                    
                    recentlyPlayed

                    if currentlyPlaying != nil {
                        Spacer(minLength: 40)
                            .layoutPriority(-1)
                    }
                }
            }
            .overlay(
                Group {
                    if let currentlyPlaying = currentlyPlaying {
                        AudioPlayer(currentlyPlaying: currentlyPlaying, showMiniPlayer: $showingMiniPlayer)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    }
                }
            )

            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(navBarTitle)
            .navigationBarHidden(navBarTitle.isEmpty)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var topPicks: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Top Picks")
                .font(.title2)
                .bold()
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(FeaturePick.topPicks) { pick in
                        FeatureCard(pick)
                            .onTapGesture(perform: playSong)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }

    var recentlyPlayed: some View {
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
                    ForEach(Album.recentlyPlayed) { album in
                        AlbumCard(album)
                            .onTapGesture(perform: playSong)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .padding(.vertical, 14)
    }

    func playSong() {
        withAnimation {
            currentlyPlaying = currentlyPlaying == nil ? .example : nil
            showingMiniPlayer = true
        }
    }
}

struct ListenNow_Previews: PreviewProvider {
    static var previews: some View {
        ListenNow()
    }
}
