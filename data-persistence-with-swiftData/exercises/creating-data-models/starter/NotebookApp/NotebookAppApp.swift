//
//  NotebookAppApp.swift
//  NotebookApp
//

import SwiftUI
// Import SwiftData

@main
struct NotebookAppApp: App {
    let modelContainer: ModelContainer

    init() {
        do {
            // ModelContainer initialization for Notes model
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }

    var body: some Scene {
        WindowGroup {
            // Inject ModelContainer into ContentView using modelContainer
            ContentView()
        }
    }
}
