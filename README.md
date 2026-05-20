# Cat App 🐱

## APP UNDER CONSTRUCTION, NOT FINISHED YET

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-16%2B-blue.svg)](https://developer.apple.com/ios/)

A modern iOS app for cat enthusiasts, built with SwiftUI and Clean Architecture.

## 🏗️ Architecture

### Clean Architecture Layers
catOS/
├── App configuration
├── UI/ # SwiftUI Views + ViewModels
├── Domain/ # Business logic
│ ├── Models/ # Core models
│ ├── UseCases/ # Business rules
│ └── Repositories/ # Protocol definitions
├── Data/ # Data layer
│ ├── DTOs/ # API data models
│ ├── Mappers/ # DTO ↔ Model conversion
│ └── Repositories/ # Concrete implementations
└── Infrastructure/ # Technical services
│ ├── Network/ # Network requests
└──

### Key Patterns
- **MVVM** for UI separation
- **Repository Pattern** for data abstraction
- **Use Cases** for business logic encapsulation
- **Dependency Injection** for testability
- **SOLID Principles** throughout

## 🛠️ Technical Stack
- **100% SwiftUI**
- **Async/Await** for concurrency
- **Protocol-Oriented** design
- **Mappers** for clean API-Domain separation
- **Mockable Repositories** for unit testing
- **Dependency injection** making the code more modular, testable, and maintainable

## 🔄 Data Flow
    A ---|[View] -->|User Action| --> B[ViewModel]
    B -->|Calls| C[Use Case]
    C -->|Uses| D[Repository]
    D -->|Calls| E[API]
    E -->|Returns DTO| D
    D -->|Maps to Entity| C
    C -->|Returns Result| B
    B -->|Updates State| A


## 🚀 Getting Started

1. Clone the repo
2. Build with Xcode 15+
3. Run CatOS target
4. (Optional)
You need an api key from https://thecatapi.com/. You can register and get one from it. Currently this project is using de demo api key: **DEMO-API-KEY**

You can replace the demo api key by yours at ApiRouter.swift file 
```
        // Replace the default value
        let apiKey: String? = "DEMO-API-KEY"
```

