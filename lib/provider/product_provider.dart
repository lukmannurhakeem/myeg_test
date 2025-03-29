import 'package:flutter/material.dart';
import 'package:myeg_test/model/product_model.dart';
import 'package:myeg_test/repositories/product/product_repository.dart';
import 'package:myeg_test/services/service_locator.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _productRepository = ServiceLocator().productRepository;

  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  Future<List<ProductModel>> getAllProducts() async {
    _productList = await _productRepository.getProducts();
    return _productList;
  }

  Future<List<ProductModel>> getProductByCategory(String category) async {
    return _productList.where((element) => element.category.toString() == category).toList();
  }
}
