//
//  NotesSchemaV2.swift
//  NotebookApp
//
//  Created by Jesus Guerra on 5/9/24.
//

import Foundation
import SwiftData

enum NotesSchemaV2: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Note.self]
    }

    static var versionIdentifier: Schema.Version = .init(1, 1, 0)
}

extension NotesSchemaV2 {
    @Model
    final class Note: Identifiable, Hashable {
        enum Priority: String, Codable, CaseIterable {
            case low, medium, high
        }

        var id = UUID()
        var title: String
        var body: String
        // Add a priority property of type Priority with a default value of .medium

        init(title: String, body: String, priority: Priority = .medium) {
            self.title = title
            self.body = body
            // Assign the priority parameter to the priority property in the initializer
        }

        static func == (lhs: Note, rhs: Note) -> Bool {
            lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
}
