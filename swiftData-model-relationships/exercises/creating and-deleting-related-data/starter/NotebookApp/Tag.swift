//
//  Tag.swift
//  NotebookApp
//
//  Created by Jesus Guerra on 5/8/24.
//

import Foundation
import SwiftData

@Model
class Tag: Identifiable, Hashable {
    @Attribute(.unique) 
    var id = UUID()
//    @Attribute(.unique)
    var name: String
    var notes: [Note]?

    init(name: String) {
        self.name = name
    }

    static func == (lhs: Tag, rhs: Tag) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}
