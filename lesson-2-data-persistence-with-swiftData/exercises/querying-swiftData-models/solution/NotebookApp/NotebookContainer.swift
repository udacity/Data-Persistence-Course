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
        let schema = Schema([Note.self])
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

    private static func sampleNotes() -> [Note] {
        let sampleTitles = ["Meeting Notes",
                            "Grocery List",
                            "Book Summary",
                            "Holiday Plans",
                            "Workout Schedule",
                            "Project Ideas",
                            "Study Notes",
                            "Recipe",
                            "Budget Plan",
                            "Dream Journal",
                            "Daily Reflections",
                            "Travel Itinerary",
                            "Event Planning",
                            "Work Tasks",
                            "Gift Ideas"]
        
        let sampleBodies = ["Here are some detailed notes",
                            "Important items to buy",
                            "Summary of the book",
                            "Plans for the upcoming holiday",
                            "Weekly workout regime",
                            "New project concepts and ideas",
                            "Notes on my recent studies",
                            "My favorite recipes",
                            "Monthly budget details",
                            "Recall and analyze dreams",
                            "Reflect on the day's activities",
                            "Travel plans and stops",
                            "Tasks for organizing events",
                            "Key tasks for work completion",
                            "Ideas for gifts for upcoming occasions"]

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
