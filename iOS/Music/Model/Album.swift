//
//  Album.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 24.04.21.
//

import Foundation

struct Album: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let genre: String
    let year: Int16
    let imageName: String
    let artistID: Artist.ID
}

extension Album {
    static private(set) var all = [Album.ID: Album]()
    
    static func album(for title: String) -> Self? {
        return Self.all.values.first(where: { $0.title == title })
    }

    static func album(for title: String, genre: String, year: Int16, imageName: String, artist: Artist) -> Self {
        if let existing = album(for: title) {
            return existing
        }
        let new = Album(title: title, genre: genre, year: year, imageName: imageName, artistID: artist.id)
        all[new.id] = new
        return new
    }

    static func album(withID id: ID) -> Self {
        if let existing = Self.all[id] {
            return existing
        }
        fatalError("Album with \(id) is unknown")
    }
}

extension Album {
    var artist: Artist {
        .artist(withID: artistID)
    }

    var songs: [Song] {
        Song.all.values.filter({ $0.albumID == id })
    }
}
