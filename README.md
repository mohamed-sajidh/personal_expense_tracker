# personal_expense_tracker

A new Flutter project to track personal expenses.

## Getting Started

This project is a starting point for a Flutter application that uses Hive for local storage and GetX for state management.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Features

- Track personal expenses
- Add new expenses
- View total expenses

### Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of [Flutter](https://flutter.dev/docs/get-started/install)
- You have a compatible IDE such as [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- You have set up an emulator or have a physical device connected


### Installing

1. **Clone the repository**:
   git clone https://github.com/yourusername/personal_expense_tracker.git
   cd personal_expense_tracker

2. **Install dependencies**:
    flutter pub get

3. **Generate Hive Type Adapters**:
    dart run build_runner build --delete-conflicting-outputs


### Running the App
    flutter run 


### Project Structure

lib
|____ data
|      |_ models
|           |_ expense_model.dart
|      |_ repositories
|           |_ expense_repository.dart
|____ domain
|      |_ entities
|           |_ expense_entities.dart
|      |_ repositories
|           |_ expense_repository.dart
|      |_ usecases
|           |_ add_expense_usecases.dart
|           |_ delete_expense_usecases.dart
|           |_ get_all_expense_usecases.dart
|           |_ update_expense_usecases.dart
|____ presentation
|       |_ controllers
|           |_ home_controller.dart
|       |_ pages
|           |_ widgets
|               |_ add_expense.dart
|               |_ amount_container.dart
|               |_ showDeletePopup.dart
|               |_ showEditPopup.dart
|           |_ home_page.dart
|       |_ asset.dart
|       |_ colors.dart
|       |_ notifications.dart
|____ main.dart


### Dependencies
    GetX: State management and dependency injection
    Hive: Lightweight and fast key-value database for Flutter
    Hive Flutter: Extension for using Hive with Flutter


### Contributing
If you want to contribute to this project, please follow these steps:
    1. Fork the repository
    2. Create a new branch (git checkout -b feature/your-feature)
    3. Make your changes
    4. Commit your changes (git commit -m 'Add your feature')
    5. Push to the branch (git push origin feature/your-feature)
    6. Open a pull request