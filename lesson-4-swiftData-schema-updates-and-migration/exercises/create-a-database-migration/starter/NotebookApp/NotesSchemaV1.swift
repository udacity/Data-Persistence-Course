//
//  NotesSchemaV1.swift
//  NotebookApp
//
//  Created by Jesus Guerra on 5/9/24.
//

import Foundation
import SwiftData

enum NotesSchemaV1: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Note.self]
    }

    static var versionIdentifier: Schema.Version = .init(1, 0, 0)
}

extension NotesSchemaV1 {
    @Model
    final class Note: Identifiable, Hashable {
        var id = UUID()
        var title: String
        var body: String

        init(title: String, body: String) {
            self.title = title
            self.body = body
        }

        static func == (lhs: Note, rhs: Note) -> Bool {
            lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
}
