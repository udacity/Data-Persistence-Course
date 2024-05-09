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
            sampleTags().forEach { tag in
                container.mainContext.insert(tag)
            }
        }
        return container
    }

    private static func isEmpty(context: ModelContext) -> Bool {
        let descriptor = FetchDescriptor<Tag>()

        do {
            let existingNotes = try context.fetch(descriptor)
            return existingNotes.isEmpty
        } catch {
            return false
        }
    }

    private static func sampleTags() -> [Tag] {
        let tagNames = ["Work", "Personal", "Important"]
        return tagNames.map { Tag(name: $0) }
    }
}
