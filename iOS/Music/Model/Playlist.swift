//
//  Playlist.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 24.04.21.
//

import Foundation

struct Playlist: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let imageName: String
    let artistID: Artist.ID?
    let curatorID: Curator.ID?
    let songIDs: [Song.ID]
}

extension Playlist {
    static private(set) var all = [Playlist.ID: Playlist]()
    
    static func playlist(for name: String) -> Self? {
        return Self.all.values.first(where: { $0.title == name })
    }

    static func playlist(for name: String, imageName: String, artist: Artist?, curator: Curator?, songs: [Song]) -> Self {
        if let existing = playlist(for: name) {
            return existing
        }
        let new = Playlist(title: name, imageName: imageName, artistID: artist?.id, curatorID: curator?.id, songIDs: songs.map(\.id))
        all[new.id] = new
        return new
    }

    static func playlist(withID id: ID) -> Self {
        if let existing = Self.all[id] {
            return existing
        }
        fatalError("Playlist with \(id) is unknown")
    }
}

extension Playlist {
    var artist: Artist? {
        if let id = artistID {
            return Artist.artist(withID: id)
        }
        return nil
    }

    var curator: Curator? {
        if let id = curatorID {
            return Curator.curator(withID: id)
        }
        return nil
    }
    
    var songs: [Song] {
        songIDs.map({ Song.song(withID: $0) })
    }
}

