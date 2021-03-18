//
//  ListenNow.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 18.03.21.
//

import SwiftUI

struct ListenNow: View {
    @State private var navBarTitle: String = ""
    
    var body: some View {
        VStack {
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
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(navBarTitle)
        .navigationBarHidden(true)
    }
    
    var topPicks: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Top Picks")
                .font(.title2)
                .bold()
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    FeatureCard(title: "Featuring Alan Walker", subtitle: "Alan Walker & Similar Artists\nStation", text: nil, color: Color(#colorLiteral(red: 0.1098039216, green: 0.1568734348, blue: 0.1333114803, alpha: 1)), imageName: "AlanWalker")
                    FeatureCard(title: "Take a Load Off", subtitle: "Acoustic Hits", text: "Pop hits stripped to their bare,\nbeautiful essentials.", color: Color(#colorLiteral(red: 0.7372552752, green: 0.3804122806, blue: 0.2196018994, alpha: 1)), imageName: "AcousticHits")
                    FeatureCard(title: "Featuring Bruno Mars", subtitle: "Pure Romance", text: "Sparks fly in our all-time\nfavourite love songs.", color: Color(#colorLiteral(red: 0.7882060409, green: 0.6078792214, blue: 0.6469835639, alpha: 1)), imageName: "PureRomance")
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
                    AlbumCard(title: "2010s Hits Essentials", subtitle: "10s", imageName: "2010sHits")
                    AlbumCard(title: "Acoustic Hits", subtitle: "Apple Music Pop", imageName: "AcousticHits")
                    AlbumCard(title: "Pure Romance", subtitle: "Apple Music Pop", imageName: "PureRomance")
                }
                .padding(.horizontal, 20)
            }
        }
        .padding(.vertical, 14)
    }
    
}

struct ListenNow_Previews: PreviewProvider {
    static var previews: some View {
        ListenNow()
    }
}
