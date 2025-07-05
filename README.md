# GoodDeals - Shopping App

A modern Flutter e-commerce application implementing clean architecture principles with BLoC pattern for state management.

## 🏗️ Architecture & Folder Structure

The project follows Clean Architecture principles with a clean-architecture approach:
<pre>
lib/
├── core/
│ ├── resources/
│ │ └── api_data_state.dart
│ └── usecase/
│ └── usecase.dart
│
├── features/
│ └── ShoppingItems/
│ ├── data/
│ │ ├── converters/
│ │ │ ├── meta_converter.dart
│ │ │ └── review_converter.dart
│ │ ├── data_sources/
│ │ │ ├── local/
│ │ │ │ ├── app_database.dart
│ │ │ │ └── cart_dao.dart
│ │ │ └── remote/
│ │ │ └── Items_api_service.dart
│ │ ├── models/
│ │ │ └── Items_model.dart
│ │ └── repositories/
│ │ └── Items_repository.dart
│ │
│ ├── domain/
│ │ ├── entities/
│ │ │ └── ItemEntity.dart
│ │ ├── repositories/
│ │ │ └── Items_repository.dart
│ │ └── usecases/
│ │ ├── get_saved_items.dart
│ │ ├── items_usecase.dart
│ │ ├── remove_item.dart
│ │ └── save_item.dart
│ │
│ └── presentation/
│ ├── Bloc/
│ │ ├── cart/
│ │ │ └── cart_bloc.dart
│ │ └── items/
│ │ └── remote/
│ │ ├── remote_items_bloc.dart
│ │ ├── remote_items_event.dart
│ │ └── remote_items_state.dart
│ ├── pages/
│ │ ├── cart_page.dart
│ │ └── shoppingItemPage.dart
│ └── widgets/
│ └── Item_display_widget.dart
</pre>

## 🛠️ Technologies & Packages

### State Management
- **flutter_bloc**: ^9.1.0
  - Implements BLoC (Business Logic Component) pattern
  - Separates business logic from UI
  - Provides predictable state management

### Dependency Injection
- **get_it**: ^8.0.3
  - Service locator for dependency injection
  - Manages singleton instances
  - Facilitates testing and modularity

### Local Storage
- **floor**: ^1.5.0
  - SQLite abstraction
  - Type-safe database operations
  - Reactive database queries

### Network & API
- **retrofit**: ^4.4.2
  - Type-safe HTTP client
  - Auto-generated API interfaces
  - Simplified REST API handling
- **dio**: ^5.8.0+1
  - Powerful HTTP client
  - Interceptors support
  - Request/Response middleware


- **google_fonts**: ^6.2.1
  - Easy integration of Google Fonts
  - Custom typography

### Development Tools
- **build_runner**: ^2.4.15
  - Code generation
  - Development automation
- **retrofit_generator**: ^9.1.9
  - API client code generation
- **floor_generator**: ^1.5.0
  - Database code generation

## 🏛️ Architecture Overview

The project follows Clean Architecture principles with three main layers:

1. **Data Layer**
   - Implements repositories
   - Handles data sources (local & remote)
   - Manages data models and mapping

2. **Domain Layer**
   - Contains business logic
   - Defines entities
   - Implements use cases
   - Abstract repository interfaces

3. **Presentation Layer**
   - Manages UI components
   - Implements BLoC pattern
   - Handles user interactions

## 🔄 State Management

The application uses BLoC pattern for state management with two main blocs:

1. **RemoteItemsBloc**
   - Manages product fetching
   - Handles API states
   - Error handling

2. **CartBloc**
   - Manages shopping cart
   - Handles item quantities
   - Calculates totals

## 💾 Local Storage

Floor (SQLite) is used for local storage with:
- Type-safe database operations
- Custom type converters
- Reactive data access

## 🌐 API Integration

Retrofit is used for API integration:
- Type-safe API calls
- Automatic JSON serialization
- Error handling

## 🚀 Getting Started

1. Clone the repository
```bash
git clone https://github.com/yourusername/gooddeals.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Run code generation
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app
```bash
flutter run
```
5. Flutter version - 3.29.3
