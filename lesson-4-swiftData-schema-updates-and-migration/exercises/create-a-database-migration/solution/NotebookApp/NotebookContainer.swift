//
//  NotebookContainer.swift
//  NotebookApp
//
//  Created by Jesus Guerra on 5/6/24.
//

import Foundation
import SwiftData
import SwiftUI

actor NotebookContainer {
    @MainActor
    static func create() -> ModelContainer {
        let schema = Schema([Note.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema,
                                            migrationPlan: NotesMigrationPlan.self,
                                            configurations: configuration)
        if isEmpty(context: container.mainContext) {
            sampleNotes().forEach { note in
                container.mainContext.insert(note)
            }
        }
        return container
    }

    private static func isEmpty(context: ModelContext) -> Bool {
        let descriptor = FetchDescriptor<Note>()

        do {
            let existingNotes = try context.fetch(descriptor)
            return existingNotes.isEmpty
        } catch {
            return false
        }
    }

    private static func sampleNotes() -> [Note] {
        let sampleTitles = ["Meeting Notes",
                            "Grocery List",
                            "Workout Schedule",
                            "Project Ideas",
                            "Study Notes"]

        let sampleBodies = ["Here are some detailed notes",
                            "Important items to buy",
                            "Summary of the book",
                            "Plans for the upcoming holiday",
                            "Weekly workout regime"]

        var notes = [Note]()
        for title in sampleTitles {
            let randomBodyIndex = Int.random(in: 0 ..< sampleBodies.count)
            let body = sampleBodies[randomBodyIndex]
            let note = Note(title: title, body: body)
            notes.append(note)
        }

        return notes
    }
}
