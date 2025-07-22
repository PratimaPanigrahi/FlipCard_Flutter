
# 🎮 Tap & Play – Flutter Game App

## 📌 Project Name

**Tap & Play** is a fun and simple mobile game built with **Flutter** and **Dart**. Users can select levels and play by tapping the screen. The app features smooth navigation, a responsive dark theme, and a clean user interface. It serves as a great example of creating interactive and well-structured Flutter applications.

---

## ✨ Key Features

- **Landing Page** with the game title and a “Start Game” button.
- **Level Selection Screen** allowing users to choose from multiple game levels.
- **Game Page** displaying the selected level with tap-based interactions and dynamic updates.
- **Smooth Navigation** using `Navigator.push` for seamless transitions between screens.
- **Dark Theme** and **Responsive Layout** optimized for both mobile and tablet.
- **User-Friendly Interface** with a clean and minimal design.

---

## 🧰 Tech Stack

- **Framework:** Flutter  
- **Language:** Dart  
- **UI Components:** `Scaffold`, `MaterialApp`, `ElevatedButton`, `Navigator`, `Column`, `Center`, `Text`, `AppBar`  
- **IDE & Tools:** Visual Studio Code  
- **Platform:** Android/iOS (Flutter)

---

## 🚀 How to Run the Project

### Prerequisites:

- **Flutter SDK:** Install from [flutter.dev](https://flutter.dev)
- **Android Studio / VS Code:** Install one IDE and configure Flutter & Dart plugins.
- **Device/Emulator:** Ensure a device or emulator is available for testing.

### Steps:

```bash
# Clone the Repository
git clone https://github.com/your-username/tap-and-play.git
cd tap-and-play

# Get Dependencies
flutter pub get

# Run the App
flutter run

# Optional: Build for Release
flutter build apk --release
```

---

## 🖼️ Screens Overview

### 1. 🏁 Start Page
- Includes level selection button.
- On clicking “Start Game” ➝ navigates to level selector.

### 2. 🕹️ Game Page
- Displays: `"Memory Game - Level Easy / Medium / Hard"`
- Interactive cards to flip and match.

### 3. 🧠 Game End Page
- Shows final **score**
- Includes a **“Back to Menu”** option.

---

## 📁 File Structure

| File Name       | Responsibility                                |
|-----------------|------------------------------------------------|
| `main.dart`     | App entry point, MaterialApp, routing setup   |
| `start_page.dart` | Home screen with navigation to levels       |
| `game_level.dart`| Level selection UI and navigation logic      |
| `game_page.dart` | Game logic per level and dynamic UI updates  |

---

