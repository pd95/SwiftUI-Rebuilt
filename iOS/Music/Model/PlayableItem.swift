//
//  PlayableItem.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 24.04.21.
//

import Foundation

protocol PlayableItem {
    var id: UUID { get }

    var title: String { get }
    var subtitle: String { get }
    var imageName: String { get }

    var firstSong: Song { get }
}

extension PlayableItem {
}

extension Song: PlayableItem {
    var firstSong: Song { self }
    var subtitle: String { album.title }
}

extension Album: PlayableItem {
    var firstSong: Song { songs.first! }
    var subtitle: String { artist.title }
}

extension Artist: PlayableItem {
    var firstSong: Song { songs.first! }
    var subtitle: String { "" }
    var imageName: String { albums.first!.imageName }
}

extension Playlist: PlayableItem {
    var firstSong: Song { songs.first! }
    var subtitle: String { curator?.name ?? artist?.title ?? ""}
}

extension FeaturePick: PlayableItem {
    var firstSong: Song { item.firstSong }
}
