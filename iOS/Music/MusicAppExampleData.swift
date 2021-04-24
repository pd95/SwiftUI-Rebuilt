//
//  MusicAppExampleData.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 06.04.21.
//

import Foundation
import SwiftUI

extension Song {
    static let mySongs: [Song] = [
        .song(for: "On n’a qu’une terre", duration: 188, imageName: "OnAQuUneTerre", album: .album(for: "On n’a qu’une terre - Single", genre: "Hip-Hop/Rap", year: 2007, imageName: "OnAQuUneTerre", artist: .artist(for: "Stress"))),
        .song(for: "Bleiben Sie Zuhause (feat. Bundesrat)", duration: 240, imageName: "BleibenSieZuhause", album: .album(for: "Bleiben Sie Zuhause (feat. Bundesrat) - Single", genre: "Dance", year: 2020, imageName: "BleibenSieZuhause", artist: .artist(for: "Zwei Am Morge"))),
        .song(for: "Happier", duration: 214, imageName: "Happier", album: .album(for: "Happier - Single", genre: "Dance", year: 2018, imageName: "Happier", artist: .artist(for: "Marshmello, Bastille"))),
        .song(for: "Are You with Me (Radio Edit)", duration: 138, imageName: "AreYouWithMe", album: .album(for: "Are You with Me - Single", genre: "Dance", year: 2014, imageName: "AreYouWithMe", artist: .artist(for: "Lost Frequencies"))),
        .song(for: "Reality (feat. Janieck Devy) ", duration: 158, imageName: "Reality", album: .album(for: "Reality (feat. Janieck Devy) - Single", genre: "Dance", year: 2015, imageName: "Reality", artist: .artist(for: "Lost Frequencies"))),
        .song(for: "Alone", duration: 161, imageName: "Alone", album: .album(for: "Alone - Single", genre: "Dance", year: 2016, imageName: "Alone", artist: .artist(for: "Alan Walker"))),
        .song(for: "Spectre", duration: 230, imageName: "Spectre", album: .album(for: "Spectre - Single", genre: "Dance", year: 2015, imageName: "Spectre", artist: .artist(for: "Alan Walker"))),
        .song(for: "Faded", duration: 212, imageName: "Faded", album: .album(for: "Faded - EP", genre: "Dance", year: 2015, imageName: "Faded", artist: .artist(for: "Alan Walker"))),
        .song(for: "Wake Me Up", duration: 249, imageName: "True", album: .album(for: "True", genre: "House", year: 2013, imageName: "True", artist: .artist(for: "Avicii"))),
        .song(for: "Waiting For Love", duration: 220, imageName: "Stories", album: .album(for: "Stories", genre: "Dance", year: 2015, imageName: "Stories", artist: .artist(for: "Avicii"))),
        .song(for: "For a Better Day", duration: 206, imageName: "Stories", album: .album(for: "Stories", genre: "Dance", year: 2015, imageName: "Stories", artist: .artist(for: "Avicii"))),
        .song(for: "The Nights", duration: 176, imageName: "DaysNights", album: .album(for: "The Days/Nights EP", genre: "Dance", year: 2014, imageName: "DaysNights", artist: .artist(for: "Avicii"))),
        .song(for: "The Days", duration: 278, imageName: "DaysNights", album: .album(for: "The Days/Nights EP", genre: "Dance", year: 2014, imageName: "DaysNights", artist: .artist(for: "Avicii"))),
    ]

    static let example: Song = mySongs.first!
}

extension Playlist {
    static let myPlaylists: [Playlist] = [
        .playlist(for: "Acoustic Hits", imageName: "PlaylistAcousticHits", artist: nil, curator: .curator(for: "Apple Music Pop"), songs: [.example]),
        .playlist(for: "2010s Hits Essentials", imageName: "Playlist2010sHits", artist: nil, curator: .curator(for: "10s"), songs: [.example]),
        .playlist(for: "Pure Romance", imageName: "PlaylistPureRomance", artist: nil, curator: .curator(for: "Apple Music Pop"), songs: [.example]),
        .playlist(for: "2010er Singer-Songwriter Essentials", imageName: "Playlist2010SingerSongwriter", artist: nil, curator: .curator(for: "90s"), songs: [.example]),
    ]

    static let recentlyPlayed: [PlayableItem] = {
        let _ = myPlaylists
        return [
            Album.album(for: "On n’a qu’une terre - Single")!,
            Playlist.playlist(for: "2010s Hits Essentials")!,
            Playlist.playlist(for: "Acoustic Hits")!,
            Playlist.playlist(for: "Pure Romance")!,
        ]
    }()
}

extension FeaturePick {
    static let topPicks: [FeaturePick] = {
        let _ = Playlist.myPlaylists
        let picks = [
            FeaturePick(title: "Featuring Alan Walker", subtitle: "Alan Walker & Similar Artists\nStation", text: nil, color: Color(#colorLiteral(red: 0.1098039216, green: 0.1568734348, blue: 0.1333114803, alpha: 1)), imageName: "RadioAlanWalker", item: Artist.artist(for: "Alan Walker")),
            FeaturePick(title: "Take a Load Off", subtitle: "Acoustic Hits", text: "Pop hits stripped to their bare,\nbeautiful essentials.", color: Color(#colorLiteral(red: 0.7372552752, green: 0.3804122806, blue: 0.2196018994, alpha: 1)), imageName: "PlaylistAcousticHits", item: Playlist.playlist(for: "Acoustic Hits")!),
            FeaturePick(title: "Featuring Bruno Mars", subtitle: "Pure Romance", text: "Sparks fly in our all-time\nfavourite love songs.", color: Color(#colorLiteral(red: 0.7882060409, green: 0.6078792214, blue: 0.6469835639, alpha: 1)), imageName: "PlaylistPureRomance", item: Playlist.playlist(for: "Pure Romance")!),
        ]
        return picks
    }()
}

