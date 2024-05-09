//
//  NotebookAppApp.swift
//  NotebookApp
//

import SwiftUI
import SwiftData

// MARK: - SwiftData Models
typealias Note = NotesSchemaV3.Note

@main
struct NotebookAppApp: App {
      var body: some Scene {
          WindowGroup {
              ContentView()
          }
          .modelContainer(NotebookContainer.create())
      }
}
