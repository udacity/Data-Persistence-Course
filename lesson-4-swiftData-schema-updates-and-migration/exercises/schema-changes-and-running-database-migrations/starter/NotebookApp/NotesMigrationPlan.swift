//
//  NotesMigrationPlan.swift
//  NotebookApp
//
//  Created by Jesus Guerra on 5/9/24.
//

import Foundation
import SwiftData

enum NotesMigrationPlan: SchemaMigrationPlan {
    // a. Add NotesSchemaV3 to the `schemas` array
    static var schemas: [VersionedSchema.Type] {
        [NotesSchemaV1.self, NotesSchemaV2.self]
    }

    // c. Add `migrateV2toV3` to the `stages` array
    static var stages: [MigrationStage] {
        [migrateV1toV2]
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

    // b. Create a migration stage variable `migrateV2toV3` to go from NotesSchemaV2 to NotesSchemaV3

}
