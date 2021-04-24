//
//  Song.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 24.04.21.
//

import Foundation

struct Song: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let duration: Double
    let imageName: String
    
    let albumID: Album.ID
}

extension Song {
    static private(set) var all = [Song.ID: Song]()
    
    static func song(for name: String) -> Self? {
        return Self.all.values.first(where: { $0.title == name })
    }

    static func song(for name: String, duration: Double, imageName: String, album: Album) -> Self {
        if let existing = song(for: name) {
            return existing
        }
        let new = Song(title: name, duration: duration, imageName: imageName, albumID: album.id)
        all[new.id] = new
        return new
    }

    static func song(withID id: ID) -> Self {
        if let existing = Self.all[id] {
            return existing
        }
        fatalError("Song with \(id) is unknown")
    }
}

extension Song {
    var album: Album {
        .album(withID: albumID)
    }
    
    var artist: Artist {
        album.artist
    }
}
