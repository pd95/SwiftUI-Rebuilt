//
//  Curator.swift
//  Rebuilt (iOS)
//
//  Created by Philipp on 24.04.21.
//

import Foundation

struct Curator: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

extension Curator {
    static private(set) var all = [Curator.ID: Curator]()

    static func curator(for name: String) -> Self {
        if let existing = Self.all.values.first(where: { $0.name == name }) {
            return existing
        }
        let new = Curator(name: name)
        all[new.id] = new
        return new
    }

    static func curator(withID id: ID) -> Self? {
        if let existing = Self.all[id] {
            return existing
        }
        fatalError("Curator with \(id) is unknown")
    }
}
