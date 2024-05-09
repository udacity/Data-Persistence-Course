### Exercise: Creating a Database Migration in SwiftData

## Overview

In this exercise, you'll learn how to create a database migration in SwiftData by extending the `NotebookApp` application. The migration will involve moving from `NotesSchemaV1` to `NotesSchemaV2`, which includes adding a new `priority` property to the `Note` model.

### Objective

By the end of this exercise, you'll be able to:
- Create and configure a `VersionedSchema` for database migrations.
- Create migration steps and successfully migrate data.

### Explanation of Migration Process

1. **Starter Code Explanation:**
   - If the user runs a clean install of the starter code, the `NotebookContainer` will create a set of notes using the `Note` model from `NotesSchemaV1`, which does not include a priority property.

2. **Solution Code Explanation:**
   - Once the migration to `NotesSchemaV2` is implemented and the `priority` property is added to the new `Note` model in `NotesSchemaV2`, building the project again will ensure that existing/stored notes now have a priority property.

### Proof of Successful Migration

1. After migrating the schema to `NotesSchemaV2`:
   - Existing notes will have the `priority` property.
   - The UI will display the priority accordingly.

2. This serves as proof that the SwiftData database migration was successful.

### Instructions

1. **Starter:**
   - Navigate to the `starter` folder and open `NotebookApp.xcodeproj`.
   - Your task is to implement the missing code as indicated by comments in the Swift files:
     - `NotesSchemaV2.swift`
     - `NotesMigrationPlan.swift`
     - `NotebookContainer.swift`
     - `NoteSummary.swift`
     - `NotebookAppApp.swift`
   - Follow the instructions outlined in the comments to create and configure the database migration.

2. **Solution:**
   - After completing the exercise, or if you need to check your work, you can find the complete code in the `solution` folder.
   - Compare your solution with the completed code to understand different approaches or to debug any issues you encountered.

### Setup

- Ensure you have the latest version of Xcode installed on your Mac.
- Open the Xcode project from the `starter` folder to begin the exercise.

### Note

- The data added and modified in this app will persist across app restarts, as it is saved using SwiftData.

Feel free to reach out if you encounter any difficulties or have questions regarding the exercises.

Happy coding!
