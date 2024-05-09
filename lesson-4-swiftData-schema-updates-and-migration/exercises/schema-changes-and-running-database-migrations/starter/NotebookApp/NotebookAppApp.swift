//
//  NotebookAppApp.swift
//  NotebookApp
//

import SwiftUI
import SwiftData

// MARK: - SwiftData Models
//Replace the Note typealias from NotesSchemaV2.Note to NotesSchemaV3.Note in NotebookAppApp.
typealias Note = NotesSchemaV2.Note

@main
struct NotebookAppApp: App {
      var body: some Scene {
          WindowGroup {
              ContentView()
          }
          .modelContainer(NotebookContainer.create())
      }
}
