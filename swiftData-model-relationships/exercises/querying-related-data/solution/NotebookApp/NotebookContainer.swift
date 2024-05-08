//
//  NotebookContainer.swift
//  NotebookApp
//
//  Created by Jesus Guerra on 5/6/24.
//

import Foundation
import SwiftData
import SwiftUI

class NotebookContainer {
    @MainActor
    static func create() -> ModelContainer {
        let schema = Schema([Note.self, Tag.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: configuration)
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

    static func sampleTags() -> [Tag] {
        let tagNames = ["Work", "Personal", "Important"]
        return tagNames.map { Tag(name: $0) }
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
        let tags = sampleTags()
        for title in sampleTitles {
            let randomBodyIndex = Int.random(in: 0 ..< sampleBodies.count)
            let randomTagIndex = Int.random(in: 0..<tags.count)
            let body = sampleBodies[randomBodyIndex]
            let note = Note(title: title, body: body)
            note.tag = tags[randomTagIndex]
            notes.append(note)
        }

        return notes
    }
}
