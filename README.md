# AppVelox Studio | Enterprise Architecture Demo

![AppVelox Banner](screenshots/banner.png)

**Clean Architecture. Scalable Foundation. Production Ready.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean-success)]()
[![State](https://img.shields.io/badge/State-Bloc-purple)]()

[View Demo](#-the-visual-proof) • [Architecture](#-technical-architecture) • [Key Features](#-key-features) • [Getting Started](#-getting-started)

---

## 🚀 Overview

This repository serves as a **reference implementation** of modern Flutter development practices. It is a financial dashboard application built to demonstrate how to structure a scalable, testable, and maintainable codebase using **Uncle Bob's Clean Architecture**.

Instead of a "Hello World" app, this project tackles real-world challenges:
* **Separation of Concerns:** Strict layer boundaries (Domain, Data, Presentation).
* **Localization:** Fully localized (EN/ES) without hardcoded strings.
* **Theming:** Seamless Dark/Light mode switching.
* **Complex UI:** Smooth, staggered animations and custom charts.

---

## 📱 The Visual Proof

*See the Animations, Dark Mode, and Localization in action.*

![App Demo GIF](screenshots/app_demo.gif)

> *The UI features staggered list animations, a reactive chart, and instant theme switching.*

---

## ✨ Key Features

* **Clean Architecture:** Strict separation into `Data`, `Domain`, and `Presentation` layers.
* **State Management:** Predictable state flow using `flutter_bloc` and `Cubit`.
* **Dependency Injection:** Decoupled modules using `injectable` and `get_it`.
* **Internationalization (i18n):** Support for English and Spanish via standard ARB files.
* **Theme Support:** Robust Dark and Light mode implementation using `ThemeCubit`.
* **Immutable Data:** All entities and states are frozen for type safety (`freezed`).
* **Routing:** Type-safe navigation using `go_router`.

---

## 🏗️ Technical Architecture

We adhere to the **Dependency Rule**: *Source code dependencies only point inwards.* The inner layers (Domain) know nothing about the outer layers (UI/Data).

### 1. 🧠 Domain Layer (The Core)
* **Pure Dart:** No Flutter dependencies.
* **Entities:** `TransactionEntity` (Pure business object).
* **Repository Interfaces:** Defines the contract for data access.

### 2. 🔌 Data Layer (The Adapter)
* **Models:** `TransactionModel` (Handles JSON parsing and mapping).
* **Repositories:** Implementation of domain interfaces.
* **Data Sources:** Handles the raw data fetching logic.

### 3. 📱 Presentation Layer (The UI)
* **BLoC/Cubit:** Manages `Theme`, `Localization`, and `Dashboard` state.
* **Screens:**
    * **Dashboard:** Financial overview with charts.
    * **Transactions:** List view with hero animations.
    * **Details:** Detailed view of specific transactions.

---

## 🛠️ The Tech Stack

| Category | Library | Usage |
| :--- | :--- | :--- |
| **State** | `flutter_bloc` | Managing global and local state. |
| **DI** | `injectable` | Automatic dependency injection generation. |
| **Routing** | `go_router` | Declarative routing solution. |
| **Immutability** | `freezed` | Generated value equality and copyWith. |
| **Charts** | `fl_chart` | Rendering the dashboard spending chart. |
| **Animations** | `flutter_animate` | Staggered list and entrance animations. |
| **L10n** | `flutter_localizations` | Native localization support. |

---

## 📂 Project Structure

We follow a **Feature-First** structure for scalability.

```text
lib/
├── core/                  # Global utilities (DI, Router, Theme)
├── features/
│   ├── dashboard/         # Feature: Dashboard & Charts
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── transactions/      # Feature: Transaction List & Details
├── l10n/                  # ARB Localization files
└── main.dart              # Entry point
```

---

## ⚡ Getting Started

### Prerequisites
* Flutter SDK: `3.x`
* Dart SDK: `3.x`

### Installation

1.  **Clone the repo:**
    ```bash
    git clone [https://github.com/your-org/appvelox-studio.git](https://github.com/your-org/appvelox-studio.git)
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run Code Generator:**
    *Required for `freezed` and `injectable`.*
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the App:**
    ```bash
    flutter run
    ```

---

## 🤝 Ready to Build?

**AppVelox Studio** builds high-quality, maintainable mobile applications. This project demonstrates our commitment to code quality and architectural best practices.

📧 **Contact us:** [faizan@appvelox.com](mailto:faizan@appvelox.com)

---
© 2025 AppVelox Studio. Built with ❤️ and Flutter.