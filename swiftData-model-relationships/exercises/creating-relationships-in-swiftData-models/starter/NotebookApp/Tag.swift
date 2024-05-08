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
    // Add @Attribute(.unique) macro
    var id = UUID()

    // Add a name property
    // Add a notes optional array

    init(name: String) {
        self.name = name
    }

    static func == (lhs: Tag, rhs: Tag) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
