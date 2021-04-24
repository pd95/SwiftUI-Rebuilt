//
//  Artist.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 24.04.21.
//

import Foundation

struct Artist: Identifiable, Hashable {
    let id = UUID()
    let title: String
}

extension Artist {
    static private(set) var all = [Artist.ID: Artist]()

    static func artist(for name: String) -> Self {
        if let existing = Self.all.values.first(where: { $0.title == name }) {
            return existing
        }
        let new = Artist(title: name)
        all[new.id] = new
        return new
    }

    static func artist(withID id: ID) -> Self {
        if let existing = Self.all[id] {
            return existing
        }
        fatalError("Artist with \(id) is unknown")
    }
}


extension Artist {
    var albums: [Album] {
        Album.all.values.filter({ $0.artistID == id })
    }
    var songs: [Song] {
        Album.all.values.filter({ $0.artistID == id }).reduce([]) { (songs, album) -> [Song] in
            songs + album.songs
        }
    }
}
