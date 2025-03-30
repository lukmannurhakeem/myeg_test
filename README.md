# 📱 Flutter E-commerce App

<p align="center">
  <img src="assets/app_icon.png" alt="App Icon" width="120" height="120"/>
</p>

A modern Flutter e-commerce application that allows users to **browse products**, **search**, **filter by category**, and **manage a shopping cart** with persistence.

---

## ✨ Features

✅ **Product Browsing** – View a grid of products with images, titles, prices, and ratings.  
✅ **Shopping Cart**:
   - Add products to the cart.
   - Remove products from the cart.
   - Persist cart data across app restarts (via **SharedPreferences**).
   - Display total number of items in the cart.

---

## 📂 Project Structure

```
lib/
├── model/
│   └── product_model.dart         # Product data model
├── provider/
│   └── product_provider.dart      # State management for products & cart
├── repositories/
│   └── product/
│       └── product_repository.dart # API calls for fetching products
├── screens/
│   ├── product_list_screen.dart   # Product listing screen
│   └── cart_screen.dart           # Shopping cart screen
├── services/
│   └── service_locator.dart       # Dependency injection setup
├── theme/
│   └── color_theme.dart           # App theming & styles
├── widgets/
│   ├── common_product_card.dart   # Reusable product card widget
│   └── common_snackbar.dart       # Custom snackbar notifications
└── main.dart                      # App entry point
```

---

## 🚀 Getting Started

### 📌 Prerequisites

- **Flutter SDK** (version 3.29.2 or later)
- **Dart SDK** (compatible with Flutter 3.29.2)
- **Android Studio / VS Code** with Flutter extensions

### 📥 Installation

1️⃣ Clone the repository:
   ```bash
   git clone https://github.com/yourusername/flutter-ecommerce-app.git
   ```
2️⃣ Navigate to the project directory:
   ```bash
   cd flutter-ecommerce-app
   ```
3️⃣ Check Flutter version:
   ```bash
   flutter --version
   ```
   If required, switch to **Flutter 3.29.2**:
   ```bash
   flutter version 3.29.2
   ```
4️⃣ Install dependencies:
   ```bash
   flutter pub get
   ```
5️⃣ Run the app:
   ```bash
   flutter run
   ```

---

## 📦 Dependencies

🔹 `provider` – State management  
🔹 `shared_preferences` – Local storage for cart items  
🔹 `http` – API requests (used in repository pattern)  
🔹 `dio` – Powerful HTTP client for networking  

---

## 🛠 Implementation Details

### 🏗 Product Provider

The `ProductProvider` class is responsible for:
- Fetching products from the API.
- Filtering products by search term and category.
- Managing the shopping cart.
- Persisting cart data using **SharedPreferences**.

### 📌 Product Card

The `CommonProductCard` widget displays:
- Product **image**, **title**, **price**, and **rating**.
- An **Add to Cart** button that toggles state.

---

## 📸 Screenshots

![add_to_cart_2](https://github.com/user-attachments/assets/71cebb51-74fe-4b90-b62b-4d19a19c1f4f)
![add_to_cart](https://github.com/user-attachments/assets/ebff0434-9c48-4077-bc56-6fdf8e8708ba)
![home_second_banner](https://github.com/user-attachments/assets/e59c4c09-5e9d-4b13-9e8b-2909b0d62427)
![home](https://github.com/user-attachments/assets/ee3190cb-7f11-4625-86b9-b0ca717ab669)
![splash](https://github.com/user-attachments/assets/2613cbd3-53e7-43ff-a26a-95a80f6ac1a7)
![remove_cart](https://github.com/user-attachments/assets/dcd97313-7da4-4fc6-aefc-d13d580af939)
![cart](https://github.com/user-attachments/assets/7e24158e-0ac5-4632-b567-b2a440b79b79)

---

## 🔮 Future Improvements

✨ User authentication  
✨ Payment integration  
✨ Order history  
✨ Product favorites  
✨ Product details screen  
✨ Product reviews  
✨ Animations & transitions  

---

## 📜 License

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.

