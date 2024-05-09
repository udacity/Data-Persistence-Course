### Exercise: Schema Changes and Running Database Migrations

## Overview

In this exercise, you'll implement a property rename migration and chain multiple migrations together using the Notebook app. You'll ensure that existing data is migrated seamlessly to the new schema and remains consistent.

### Objective

By the end of this exercise, you'll be able to:
- Chain migrations in the `SchemaMigrationPlan`.
- Rename properties using the `@Attribute(originalName:)` macro.
- Maintain consistent data across schema changes.

### Solution Notes: Chaining Migrations in SchemaMigrationPlan

1. **Chaining Migrations in SchemaMigrationPlan:**
   - We can chain migrations in the `SchemaMigrationPlan` by adding multiple `MigrationStage` instances to the `stages` array.
   - In this exercise, we've demonstrated the process by chaining migrations from `NotesSchemaV1` to `NotesSchemaV2`, and then to `NotesSchemaV3`.

2. **Proof of Successful Migration:**
   - After running the migration to rename the `body` property to `content` in `NotesSchemaV3`, the app should work without any issues.
   - The old data should seamlessly transition to the new schema while maintaining consistency.
   - Newly created notes should include the `content` property instead of `body`, proving that the data migration worked effectively.

3. **How to Verify:**
   - Run the app with existing data using the starter code for `NotesSchemaV2`.
   - Apply the migration to `NotesSchemaV3` by switching to the solution code.
   - After the migration, observe that all existing notes display their content correctly and new notes can be created without errors.

4. **Key Takeaway:**
   - Properly chaining migrations and ensuring consistent data transformations during each step helps maintain data integrity across schema changes.

### Instructions

1. **Starter:**
   - Navigate to the `starter` folder and open `NotebookApp.xcodeproj`.
   - Implement the missing code as indicated by comments in the following Swift files:
     - `NotesSchemaV3.swift`
     - `NotesMigrationPlan.swift`
     - `NotebookAppApp.swift`
   - Follow the instructions outlined in the comments to implement and verify the chained migrations.

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
