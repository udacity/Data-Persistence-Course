### Exercise: Creating Data Models with SwiftData

## Overview

In this exercise, you will transition the Notebook app from using simple in-memory data models to more robust and scalable data models using SwiftData. This integration will enable more efficient data handling and persistence, preparing the app for more complex functionalities.

## Objectives
- Create SwiftData models for the Notebook app.
- Replace mock models and storage classes with SwiftData entities.
- Configure the SwiftData environment, initialize the ModelContainer, and inject it into the `App.swift` file.
- Set up the ModelContainer for use throughout the app.

## Instructions

1. **NotebookContainer.swift:**

   - **Tasks:**
     - Define a `Schema` with `Note.self` indicating the models managed by this schema.
     - Create a `ModelConfiguration` for any needed configurations.
     - Initialize and return a `ModelContainer` using the above schema and configuration.

2. **NotebookAppApp.swift:**

   - **Tasks:**
     - Initialize the `ModelContainer` by calling the `create()` method from `NotebookContainer`.
     - Use the `.modelContainer()` modifier on the `WindowGroup` to inject the `ModelContainer` into the app.

3. **ContentView.swift:**

   - **Tasks:**
     - Replace the `@State` property for notes with a `@Query` to dynamically fetch notes from the data store.
     - Create an `@Environment` variable named `context` to reference the `modelContext`.
     - Modify the `addNote()` function to use the `insert()` method on the `context` to add new entries.

## Setup
- Ensure you have the latest version of Xcode and the SwiftData framework installed on your Mac.
- Open the Xcode project from the `starter` folder to begin the exercise.

## Solution
- After completing the exercise, or if you need to check your work, you can find the complete code in the `solution` folder.
- Compare your solution with the completed code to understand different approaches or to debug any issues you encountered.

Feel free to reach out if you encounter any difficulties or have questions regarding the exercises.

Happy coding!
