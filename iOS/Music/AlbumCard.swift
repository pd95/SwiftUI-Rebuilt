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

    var body: some View {
        VStack(alignment: .leading) {
            albumImage
            Text(title)
            Text(subtitle)
                .font(.caption2)
                .foregroundColor(.secondary)
            
        }
    }

    var albumImage: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 163, height: 163, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct AlbumCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlbumCard(title: "2010s Hits Essentials", subtitle: "10s", imageName: "2010sHits")
            AlbumCard(title: "Acoustic Hits", subtitle: "Apple Music Pop", imageName: "AcousticHits")
            AlbumCard(title: "Pure Romance", subtitle: "Apple Music Pop", imageName: "PureRomance")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
