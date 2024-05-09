//
//  NotesSchemaV3.swift
//  NotebookApp
//
//  Created by Jesus Guerra on 5/9/24.
//

import Foundation
import SwiftData

enum NotesSchemaV3: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Note.self]
    }

    // Increase the version number to be greater than NotesSchemaV2
    // Since this is a property rename migration, we can update the patch number
    static var versionIdentifier: Schema.Version = .init(1, 1, 0)
}

extension NotesSchemaV3 {
    @Model
    final class Note: Identifiable, Hashable {
        enum Priority: String, Codable, CaseIterable {
            case low, medium, high
        }

        var id = UUID()
        var title: String

        // Rename the `body` property to `content` and preserve its original name using the @Attribute(originalName: "body") macro
        var body: String

        var priority: Priority = Priority.medium

        init(title: String, body: String, priority: Priority = .medium) {
            self.title = title
            // Replace the body reference with content.
            self.body = body
            self.priority = priority
        }

        static func == (lhs: Note, rhs: Note) -> Bool {
            lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
}
