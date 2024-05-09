//
//  NotebookAppApp.swift
//  NotebookApp
//

import SwiftUI
import SwiftData

// MARK: - SwiftData Models
// Update the Note typealias to use NotesSchemaV2 instead of NotesSchemaV1
typealias Note = NotesSchemaV1.Note

@main
struct NotebookAppApp: App {
      var body: some Scene {
          WindowGroup {
              ContentView()
          }
          .modelContainer(NotebookContainer.create())
      }
}
