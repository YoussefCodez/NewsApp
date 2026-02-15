# News App 📰

A modern Flutter application designed to fetch and display the latest news articles from various sources. This project is built with a focus on **Clean Architecture**, ensuring scalability, testability, and maintainability.

## 🚀 Features

*   **Browse News**: View the latest headlines and articles from top sources.
*   **Search Functionality**: Search for specific news topics or keywords.
*   **Source Filtering**: Explore news from different providers.
*   **Responsive Design**: optimized for various screen sizes using `flutter_screenutil`.
*   **Smooth Animations**: Enhanced user experience with `flutter_animate`.

## 🏗️ Architecture

This project follows the **Clean Architecture** principles, separating the codebase into three main layers:

1.  **Presentation Layer**: Contains the UI (Widgets, Pages) and State Management (Bloc/Cubit).
2.  **Domain Layer**: Contains the business logic, Entities, and Use Cases. It is independent of any external libraries.
3.  **Data Layer**: Handles data retrieval (API calls), Models, and Repositories implementation.

## 🛠️ Tech Stack & Packages

*   **Framework**: [Flutter](https://flutter.dev/)
*   **Language**: [Dart](https://dart.dev/)
*   **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
*   **Networking**: [dio](https://pub.dev/packages/dio) for efficient API requests.
*   **Functional Programming**: [dartz](https://pub.dev/packages/dartz) for handling success/error states (Either).
*   **UI/UX**:
    *   [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) for adaptive sizing.
    *   [flutter_svg](https://pub.dev/packages/flutter_svg) for vector icons.
    *   [gap](https://pub.dev/packages/gap) for spacing.
    *   [flutter_animate](https://pub.dev/packages/flutter_animate) for animations.
