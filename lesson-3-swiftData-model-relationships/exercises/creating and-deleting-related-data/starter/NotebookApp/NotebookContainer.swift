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

        // Check if the database is empty using the isEmpty function
        // If empty, populate it using sampleTags()

        return container
    }

    private static func isEmpty(context: ModelContext) -> Bool {
        // Create a FetchDescriptor for Tag to check if the database is empty

        do {
            let existingNotes = try context.fetch(descriptor)
            return existingNotes.isEmpty
        } catch {
            return false
        }
    }

    private static func sampleTags() -> [Tag] {
        // Create an array of tag names and map them to Tag objects
        return tagNames.map { Tag(name: $0) }
    }
}

