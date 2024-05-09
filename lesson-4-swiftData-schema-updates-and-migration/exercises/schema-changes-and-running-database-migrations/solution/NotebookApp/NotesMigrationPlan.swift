//
//  NotesMigrationPlan.swift
//  NotebookApp
//
//  Created by Jesus Guerra on 5/9/24.
//

import Foundation
import SwiftData

enum NotesMigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] {
        [NotesSchemaV1.self, NotesSchemaV2.self, NotesSchemaV3.self]
    }

    static var stages: [MigrationStage] {
        [migrateV1toV2, migrateV2toV3]
    }

    static let migrateV1toV2 = MigrationStage.custom(
        fromVersion: NotesSchemaV1.self,
        toVersion: NotesSchemaV2.self,
        willMigrate: nil,
        didMigrate: { context in
            // Fetch all notes from V2
            let fetchDescriptor = FetchDescriptor<NotesSchemaV2.Note>()
            let existingNotes = try? context.fetch(fetchDescriptor)
            existingNotes?.forEach { note in
                let allPriorities = NotesSchemaV2.Note.Priority.allCases
                let randomPriorityIndex = Int.random(in: 0 ..< allPriorities.count)
                let priority = allPriorities[randomPriorityIndex]
                note.priority = priority
            }
            try? context.save()
        }
    )

    static let migrateV2toV3 = MigrationStage.custom(fromVersion: NotesSchemaV2.self,
                                                     toVersion: NotesSchemaV3.self,
                                                     willMigrate: nil,
                                                     didMigrate: nil)
}
