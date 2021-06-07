//
//  ContentView.swift
//  Shared
//
//  Created by Philipp on 14.03.21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    enum PrototypeUI: Int {
        case none
        case musicApp
        case mailApp
    }
    
    @SceneStorage("currentUI") private var currentUI: PrototypeUI = .none
    
    var body: some View {
        Group {
            switch currentUI {
            case .musicApp:
                MusicApp(dismiss: { currentUI = .none })
            case .mailApp:
                MailApp(dismiss: { currentUI = .none })
            default:
                VStack {
                    Text("Choose an app/UI:")
                        .font(.title)
                    
                    VStack {
                        Button(action: {
                            currentUI = .musicApp
                        }) {
                            Label("Music App", systemImage: "music.note")
                                .padding()
                        }
                        Button(action: {
                            currentUI = .mailApp
                        }) {
                            Label("Mail App", systemImage: "envelope")
                                .padding()
                        }
                    }
                }
                .padding()
                .navigationTitle("Rebuilt UIs")
                .iOS { view in
                    NavigationView {
                        view
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
