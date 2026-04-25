# VibeStream

VibeStream is a SwiftUI-based iOS application that functions as a personal media library for tracking movies, books, and music albums. It allows users to add, organize, search, rate, and annotate media items in a clean, unified interface.

The app is built using the MVVM architecture and demonstrates local data persistence without requiring a backend service.

---

## Features

### Media Management (CRUD)
- Add new media items (movies, books, albums)
- Edit existing entries
- Delete items via swipe actions or detail view
- View detailed information for each item

### Search & Filter
- Live search by title or creator
- Instant filtering of results as you type

### Sorting
- Sort by:
  - Title (A–Z)
  - Year (ascending)
  - Category (movie, book, album)

### Rating System
- 1–5 star rating per media item
- Visual star display in detail view

### Notes Feature
- Optional notes field for additional context or personal comments
- Displayed in the detail view when available

### Local Persistence
- Data is saved locally using JSON encoding
- Items persist between app launches using FileManager

---

## Architecture

VibeStream follows the **MVVM (Model–View–ViewModel)** pattern:

### Model
- `MediaItem`
- `MediaCategory`

Stores core data for each media entry:
- id
- title
- creator
- category
- genre
- year
- rating
- notes
- dateAdded

---

### ViewModel
`MediaLibraryViewModel`

Acts as the single source of truth and handles:
- Adding items
- Updating items
- Deleting items
- Loading/saving persistent data

---

### Views (SwiftUI)
- `MediaLibraryView` → main list screen
- `MediaDetailView` → detailed item view
- `AddEditMediaView` → shared form for adding/editing
- `MediaRowView` → list item UI

---

## Data Persistence

The app uses a lightweight local storage system:

- `MediaStorageService`
  - Encodes `[MediaItem]` using `JSONEncoder`
  - Saves to app’s Documents directory
  - Loads data on app launch using `JSONDecoder`

No external database or API is required.

---

## Navigation Flow

SplashView
↓
MediaLibraryView (main screen)
↓
MediaDetailView
↓
AddEditMediaView (add/edit flow)

---

## UI Design

- SwiftUI-native layout
- Card-style detail view design
- Clean list-based library interface
- Custom app background color system
- Consistent typography hierarchy
- Light visual polish using rounded rectangles and spacing

---

## Future Improvements

If extended further, the app could include:
- Cloud sync (Firebase)
- Genre-based grouping or filtering
- Advanced analytics (most watched/read categories)
- Image/poster support for media items
- Improved animations and transitions

---

## Key Concepts Demonstrated

- SwiftUI declarative UI design
- MVVM architecture
- State management with `@StateObject` and `@ObservedObject`
- Data persistence with FileManager
- List filtering and sorting
- Form handling and validation
- Multi-view navigation with NavigationStack

---

## Author

Developed by Laura Burroughs as part of CPSC 5340 Mobile Application Development.

---

## Purpose

This project was built to demonstrate:
- Practical SwiftUI application development
- Proper architectural separation (MVVM)
- Local data persistence techniques
- Real-world app UI/UX design patterns
