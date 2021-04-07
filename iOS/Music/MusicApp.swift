//
//  MusicApp.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 18.03.21.
//

import SwiftUI

struct MusicApp: View {
    let dismiss: () -> Void
    
    @StateObject var playerState = AudioPlayerViewModel()
    
    var body: some View {
        TabView {
            ListenNow()
                .tabItem { Label("Listen Now", systemImage: "play.circle.fill") }
            
            Text("Browse")
                .tabItem { Label("Browse", systemImage: "square.grid.2x2.fill") }
            Text("Radio")
                .tabItem { Label("Radio", systemImage: "dot.radiowaves.left.and.right") }
            Text("Library")
                .tabItem { Label("Library", systemImage: "rectangle.stack.fill") }
            Text("Search")
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
        }
        .accentColor(.red)
        .environmentObject(playerState)
    }
}

struct MusicApp_Previews: PreviewProvider {
    static var previews: some View {
        MusicApp(dismiss: {})
    }
}
