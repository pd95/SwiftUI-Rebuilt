//
//  AlbumCard.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 18.03.21.
//

import SwiftUI

struct AlbumCard: View {
    let title: String
    let subtitle: String
    let imageName: String
    
    init(_ item: PlayableItem) {
        title = item.title
        subtitle = item.subtitle
        imageName = item.imageName
    }

    var body: some View {
        VStack(alignment: .leading) {
            albumImage
            Text(title)
            Text(subtitle)
                .foregroundColor(.secondary)
        }
        .frame(width: 164)
    }

    var albumImage: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 163, height: 163, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct AlbumCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlbumCard(Playlist.recentlyPlayed[0])
            AlbumCard(Playlist.recentlyPlayed[1])
            AlbumCard(Playlist.recentlyPlayed[2])
            AlbumCard(Playlist.recentlyPlayed[3])
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
