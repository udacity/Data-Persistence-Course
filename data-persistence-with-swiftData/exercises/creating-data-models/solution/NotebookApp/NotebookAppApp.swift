//
//  NotebookAppApp.swift
//  NotebookApp
//

import SwiftUI
import SwiftData

@main
struct NotebookAppApp: App {
      let modelContainer: ModelContainer

      init() {
          do {
              modelContainer = try  ModelContainer(for: Note.self)
          } catch {
              fatalError("Could not initialize ModelContainer")
          }
      }

      var body: some Scene {
          WindowGroup {
              ContentView().modelContainer(modelContainer)
          }
      }
}
