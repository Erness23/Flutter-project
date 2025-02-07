🛒 Ernes Technologies - Flutter E-Commerce App

A modern Flutter-based e-commerce application inspired by platforms like Jumia and Amazon. This app provides a seamless shopping experience, allowing users to browse products, add items to their cart, and manage orders.

🚀 Features

🏆 Core Features

User Authentication – Secure sign-up and login functionality.

Product Listings – Browse a wide range of products with descriptions, prices, and images.

Search Functionality – Find products quickly using an advanced search bar.

Shopping Cart – Add, remove, and update quantities of products in the cart.

Order Management – Track placed orders and view order history.

Wishlist – Save products for future purchases.

Payment Integration – (Future Feature) Support for payment gateways like PayPal or Stripe.

Push Notifications – (Future Feature) Get notified about order updates and promotions.

Admin Panel – (Future Feature) A dashboard to manage products and orders.

🛠 Tech Stack

Technology

Description

Flutter

Cross-platform UI toolkit for mobile, web, and desktop

Dart

Primary programming language for Flutter

SQLite / MySQL

SQL-based database for storing user and product information

Provider

State management solution for Flutter

📂 Project Structure

Flutter-project/
│── lib/
│   │── main.dart        # Entry point of the app
│   │── models/          # Data models (e.g., Product, User)
│   │── providers/       # State management (Provider)
│   │── screens/         # UI screens (e.g., Home, Cart, Profile)
│   │── widgets/         # Reusable UI components
│   │── services/        # Database and API logic
│── assets/
│   │── images/          # Product images and UI assets
│── test/
│   │── widget_tests/    # UI tests for widgets
│── pubspec.yaml         # Dependencies and assets
│── README.md            # Project documentation
│── LICENSE              # License details

🏗 Installation & Setup

✅ Prerequisites

Flutter SDK: Install from flutter.dev

Dart SDK: Comes bundled with Flutter

IDE: Use VS Code or Android Studio for development

SQLite/MySQL Setup:

If using SQLite, ensure the sqflite package is installed.

If using MySQL, set up a database server and configure the backend API.

💻 Clone the Repository

git clone https://github.com/Erness23/Flutter-project.git
cd Flutter-project

📦 Install Dependencies

flutter pub get

📄 Database Setup

For SQLite, ensure you have the sqflite package installed:

flutter pub add sqflite path

For MySQL, set up a backend API (e.g., using Node.js or PHP) to connect to the database.

▶ Run the Application

For mobile (Android/iOS):

flutter run

For web:

flutter run -d chrome

📜 Dependencies

Package

Description

sqflite

SQLite database integration

path_provider

Access file paths for local storage

provider

State management

http

API communication (for MySQL backend)

fluttertoast

Displaying toast messages

Run the following to install dependencies:

flutter pub add sqflite path_provider provider http fluttertoast

🧪 Testing

To run tests:

flutter test

For widget tests:

flutter test test/widget_tests/

🏗 Contributing

We welcome contributions! Follow these steps:

Fork the repository.

Create a new branch (feature/your-feature-name).

Commit your changes (git commit -m "Added new feature").

Push to GitHub (git push origin feature/your-feature-name).

Create a Pull Request for review.

📧 Contact

For any questions or suggestions, feel free to open an issue in the repository or reach out via email at [kamuiruernest@gmail.com].

🎉 Happy Coding & Shopping! 🛍
