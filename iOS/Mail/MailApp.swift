//
//  MailApp.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 07.06.21.
//

import SwiftUI

struct MailApp: View {
    let dismiss: () -> Void
    
    var body: some View {
        NavigationView {
            Text("Mailboxes")
            
            Text("Mails")
            
            Text("An E-Mail")
        }
    }
}

struct MailApp_Previews: PreviewProvider {
    static var previews: some View {
        MailApp(dismiss: {})
    }
}
