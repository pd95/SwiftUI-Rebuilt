//
//  ContentViewWrapper.swift
//  Rebuilt
//
//  Created by Philipp on 14.03.21.
//

import SwiftUI

struct ContentViewWrapper<Content: View> : View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

struct ContentViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWrapper(content: { Text("Hello World") })
    }
}
