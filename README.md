
# Task Management App – iOS Technical Homework

## Overview
A small native iOS task management application using
Swift and SwiftUI. 

**Features:**
- View a list of tasks
- Add a new task
- Edit an existing task (by taping on the task)
- Delete a task (by swiping to left)

Every task has title (required), description and can be marked as done.

## Architectural decisions
- **MVVM**  
  - `TodoListViewModel` manages task data and sheet/navigation state  
  - `TodoFormViewModel` manages form state and validation
  - Sheet state is controlled in the ViewModel using `ActiveSheet` enum
- **Separation of Concerns**:
  - UI logic lives in Views  
  - Data and business logic live in ViewModels  
  - No direct mutation of state in Views  
- **Thread safety**:
  - All ViewModels annotated with `@MainActor` to guarantee UI updates happen on the main thread  
- **Scalability**:
  - Architecture allows adding persistence (Core Data/SwiftData) or features without changing Views  
  - Sheet state via `ActiveSheet` enum makes it easy to add more modal flows in the future  

## Assumptions & Future Improvements
- Currently, tasks exist **in memory only** (no persistence) 
- No duplicate task validation - multiple tasks can have the same title  
- Potential enhancements:  
  - Adding additional task fields (priority, due date, categories)  
  - Local storage
  - Sorting/filtering tasks  
  - Unit/UI tests  
  - Localization for multiple languages  
  - Theming and accessibility refinements 
