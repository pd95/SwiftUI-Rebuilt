//
//  ContentView.swift
//  Shared
//
//  Created by Philipp on 14.03.21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    enum PrototypeUI {
        case musicApp
    }
    
    @State private var currentUI: PrototypeUI? = .musicApp
    
    var body: some View {
        Group {
            switch currentUI {
            case .musicApp:
                MusicApp(dismiss: { currentUI = nil })
            default:
                VStack {
                    Text("Choose an app/UI:")
                        .font(.title)
                    
                    HStack {
                        Button("Music App") {
                            currentUI = .musicApp
                        }
                    }
                    .padding()
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
