
### Exercise: Querying SwiftData Models

## Overview

This exercise focuses on integrating advanced querying capabilities in the Notebook app using SwiftData. You will implement dynamic sorting, filtering, and search functionalities, utilizing SwiftData's `SortDescriptor` and `Predicate` to manage and display data based on user interactions.

## Objectives
- Enhance the `ContentView` to dynamically query and display notes based on user input.
- Implement conditional database population in `NotebookContainer` to ensure sample data is only added when the database is empty.


## Instructions

1. **ContentView.swift**:
   - **Modify @Query**: Update the `@Query` for `notes` to include a dynamic `SortDescriptor` and a `Predicate` that filters based on `searchText`.
   - **Implement `filteredNotes`**: Define the `FetchDescriptor` within `filteredNotes` using the given predicate and sort order. Handle fetching in a `do-catch` block.


2. **NotebookContainer.swift**:
   - **Implement `isEmpty` Function**: Write a function to check if any `Note` objects exist in the database.
   - **Conditionally Populate Database**: In the `create` method, check if the database is empty using `isEmpty`. If true, populate the database with `sampleNotes`.



## Setup
- Ensure you have the latest version of Xcode installed on your Mac.
- Open the Xcode project from the `starter` folder to begin the exercise.

## Solution
- After completing the exercise, or if you need to check your work, you can find the complete code in the `solution` folder.
- Compare your solution with the completed code to understand different approaches or to debug any issues you encountered.

Feel free to reach out if you encounter any difficulties or have questions regarding the exercises.

Happy Coding!
