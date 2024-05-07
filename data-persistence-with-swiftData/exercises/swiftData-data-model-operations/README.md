### Exercise: Enhancing CRUD Operations in the Notebook App

## Overview

In this exercise, you will continue to enhance the Notebook app by adding advanced CRUD (Create, Read, Update, Delete) functionalities. This includes improving the user interface for editing notes and implementing swipe-to-delete functionality. The exercise aims to provide hands-on experience with state management, dynamic UI updates, and interactive list handling in SwiftUI.

## Objectives
- Implement an editable state in `NoteSummary` using `@State`.
- Introduce swipe-to-delete functionality for notes in the list.
- Refine the editing capabilities by adding a toggleable edit mode.

## Instructions

1. **NoteSummary View:**
   - **Initialize State Property**: Declare and initialize a `@State private var isEditing = false` to manage the editing state of each note.
   - **Editable Text Fields**: Insert `TextField`s for the note's title and body that are only accessible when `isEditing` is true. Implement a save button that toggles the editing state off.
   - **Toggle Editing**: Add a double-tap gesture to the `VStack` that toggles the `isEditing` state, enabling and disabling the edit mode.

2. **ContentView:**
   - **Swipe to Delete**: Implement functionality that allows users to swipe on a note in the list to delete it. Use the `.onDelete(perform:)` modifier on the `ForEach` in `ContentView`.
   - **Refine Filtering and Adding**: Ensure that the `filteredNotes` computed property correctly filters notes based on the search text, and that the `addNote` method adds new notes effectively.

## Setup
- Ensure you have the latest version of Xcode installed on your Mac.
- Open the Xcode project from the `starter` folder to begin the exercise.

## Solution
- After completing the exercise, or if you need to check your work, you can find the complete code in the `solution` folder.
- Compare your solution with the completed code to understand different approaches or to debug any issues you encountered.

Feel free to reach out if you encounter any difficulties or have questions regarding the exercises.

Happy coding!

