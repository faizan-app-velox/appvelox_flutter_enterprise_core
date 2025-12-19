# AppVelox Studio | Enterprise Architecture Demo

![AppVelox Banner](https://github.com/user-attachments/assets/39c728d8-5a61-47b0-a24a-ef0debda0198)

**Clean Architecture. Scalable Foundation. Production Ready.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean-4caf50?logo=layers)](https://github.com/faizan-app-velox/appvelox_flutter_enterprise_core)
[![State](https://img.shields.io/badge/State-Bloc-512bd4?logo=bloc)](https://bloclibrary.dev)

[View Demo](#-app-preview) • [Architecture](#technical-architecture) • [Key Features](#-key-features) • [Getting Started](#-getting-started)

---

## 🚀 Overview

This repository provides a definitive blueprint for modern Flutter development. It is a financial
dashboard application built to demonstrate how to structure a scalable, testable, and maintainable
codebase using **Uncle Bob's Clean Architecture**.

Instead of a "Hello World" app, this project tackles real-world challenges:

* **Separation of Concerns:** Strict layer boundaries (Domain, Data, Presentation).
* **Localization:** Fully localized (EN/ES) without hardcoded strings.
* **Theming:** Seamless Dark/Light mode switching.
* **Complex UI:** Smooth, staggered animations and custom charts.

---

## 📱 App Preview

*See the Animations, Dark Mode, and Localization in action.*

https://github.com/user-attachments/assets/bce55ec2-34cf-480e-a032-f25d759fd42c

> *The UI features staggered list animations, a reactive chart, and instant theme switching.*

---

## ✨ Key Features

* **Clean Architecture:** Strict separation into `Data`, `Domain`, and `Presentation` layers.
* **Functional Programming:** Safe, mathematical error handling using `dartz` (
  `Either<Failure, Success>`) to eliminate runtime exceptions.
* **Robust Error Handling:** Graceful UI handling for network errors, empty states, and failures
  using reusable `AppStatusWidget`.
* **State Management:** Predictable state flow using `flutter_bloc` and `Cubit`.
* **Dependency Injection:** Decoupled modules using `injectable` and `get_it`.
* **Internationalization (i18n):** Support for English and Spanish via standard ARB files.
* **Theme Support:** Robust Dark and Light mode implementation using `ThemeCubit`.
* **Immutable Data:** All entities and states are frozen for type safety (`freezed`).

---

## <a name="technical-architecture"></a>🏗️ Technical Architecture

We adhere to the **Dependency Rule**: *Source code dependencies only point inwards.* The inner
layers (Domain) know nothing about the outer layers (UI/Data).

### 1. 🧠 Domain Layer (The Core)

* **Pure Dart:** No Flutter dependencies.
* **Entities:** `TransactionEntity` (Pure business object).
* **Repository Interfaces:** Defines the contract for data access.

### 2. 🔌 Data Layer (The Adapter)

* **Repositories (Impl):** The bridge between the internet and the app.
* **Data Sources:** Manages API calls (`Retrofit`) and Local Storage.
* **Serialization:** JSON parsing via `freezed` to ensure type safety.

### 3. 📱 Presentation Layer (The UI)

* **BLoC/Cubit:** Manages `Theme`, `Localization`, and `Dashboard` state.
* **Screens:**
    * **Dashboard:** Financial overview with charts.
    * **Transactions:** List view with hero animations.
    * **Details:** Detailed view of specific transactions.
* **Shared Components:**
    * **AppStatusWidget:** A versatile component for handling non-success states (Network Errors,
      Empty Lists, Validation Failures) with consistent UI.

---

## 🛠️ The Tech Stack

* **State Management:** `flutter_bloc`
* **Dependency Injection:** `injectable`
* **Routing:** `go_router`
* **Immutability:** `freezed`
* **Charts:** `fl_chart`
* **Animations:** `flutter_animate`
* **Localization:** `flutter_localizations`

---

## 📂 Project Structure

We follow a **Feature-First** structure for scalability.

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

---

## ⚡ Getting Started

### Prerequisites

* Flutter SDK: `3.x`
* Dart SDK: `3.x`

### Installation

1. **Clone the repo:**
   `git clone https://github.com/faizan-app-velox/appvelox_flutter_enterprise_core.git`

2. **Install dependencies:**
   `flutter pub get`

3. **Run Code Generator:**
   `dart run build_runner build --delete-conflicting-outputs`

4. **Run the App:**
   `flutter run`

---

## 🤝 Ready to Build?

**AppVelox Studio** builds high-quality, maintainable mobile applications. This project demonstrates
our commitment to code quality and architectural best practices.

📧 **Contact us:
** [faizan@appvelox.com](mailto:faizan@appvelox.com) • [Chat on WhatsApp](https://wa.me/919104861766)

---
© 2025 AppVelox Studio. Built with ❤️ and Flutter.