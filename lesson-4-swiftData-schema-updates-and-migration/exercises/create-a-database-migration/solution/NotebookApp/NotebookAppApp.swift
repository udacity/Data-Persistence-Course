//
//  NotebookAppApp.swift
//  NotebookApp
//

import SwiftUI
import SwiftData

// MARK: - SwiftData Models
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
