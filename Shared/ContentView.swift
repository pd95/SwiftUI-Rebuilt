//
//  ContentView.swift
//  Shared
//
//  Created by Philipp on 14.03.21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Rebuilt UIs")
                .font(.largeTitle)
            
            Text("Choose an app/UI:")
            
            HStack {
                Button("Placeholder") {
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
