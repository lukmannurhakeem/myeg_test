import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myeg_test/model/product_model.dart';
import 'package:myeg_test/repositories/product/product_repository.dart';
import 'package:myeg_test/services/service_locator.dart';
import 'package:myeg_test/widgets/common_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _productRepository = ServiceLocator().productRepository;

  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  List<ProductModel> _addToCartList = [];
  List<ProductModel> get addToCartList => _addToCartList;

  // Constructor - load cart from storage when provider is initialized
  ProductProvider() {
    loadCartFromStorage();
  }

  Future<List<ProductModel>> getAllProducts() async {
    _productList = await _productRepository.getProducts();
    return _productList;
  }

  Future<List<ProductModel>> getProductByCategory(String category) async {
    return _productList.where((element) => element.category.toString() == category).toList();
  }

  Future<bool> addToCart(BuildContext context, ProductModel product) async {
    try {
      bool isAlreadyInCart = _addToCartList.any((item) => item.id == product.id);
      if (isAlreadyInCart) {
        return false;
      } else {
        _addToCartList.add(product);
        notifyListeners(); // Notify listeners about the change
        return true;
      }
    } catch (e) {
      CommonSnackbar.showError(context, 'Error adding product to cart: $e');
      return false;
    }
  }

  Future<void> saveCartToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> cartItemsJson = _addToCartList.map((item) => jsonEncode(item.toJson())).toList();
      await prefs.setStringList('cart_items', cartItemsJson);
    } catch (e) {
      print('Error saving cart to storage: $e');
    }
  }

  Future<void> loadCartFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartItemsJson = prefs.getStringList('cart_items') ?? [];
      _addToCartList = cartItemsJson.map((itemJson) => ProductModel.fromJson(jsonDecode(itemJson))).toList();
      notifyListeners(); // Notify listeners about the loaded cart
    } catch (e) {
      print('Error loading cart from storage: $e');
    }
  }

  List<ProductModel> getCartItems() {
    return _addToCartList;
  }

  int getCartTotal() {
    return _addToCartList.length;
  }

  Future<bool> removeFromCart(String productId) async {
    try {
      _addToCartList.removeWhere((item) => item.title == productId);
      notifyListeners(); // Notify listeners about the change

      // Save the updated cart to SharedPreferences
      await saveCartToStorage();

      return true;
    } catch (e) {
      print('Error removing product from cart: $e');
      return false;
    }
  }
}
