//
//  NotesMigrationPlan.swift
//  NotebookApp
//
//  Created by Jesus Guerra on 5/9/24.
//

import Foundation
import SwiftData

enum NotesMigrationPlan: SchemaMigrationPlan {
    // Set NotesSchemaV1.self and NotesSchemaV2.self in schemas

    static var schemas: [VersionedSchema.Type] {
        []
    }

    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }

    static let migrateV1toV2 = MigrationStage.custom(
            fromVersion: NotesSchemaV1.self,
            toVersion: NotesSchemaV2.self,
            willMigrate: nil,
            didMigrate: { context in
                // Create a fetchDescriptor variable to fetch notes from V2 using FetchDescriptor
                // Set existing notes to the result of context.fetch(fetchDescriptor)
                let existingNotes: [NotesSchemaV2.Note]? = nil
                existingNotes?.forEach({ note in
                    // Assign a random priority to existing notes
                })
                try? context.save()
            }
        )
}
