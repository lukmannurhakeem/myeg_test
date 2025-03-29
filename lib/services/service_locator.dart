import 'package:dio/dio.dart';
import 'package:myeg_test/constants/constant.dart';
import 'package:myeg_test/repositories/product/product_impl.dart';
import 'package:myeg_test/repositories/product/product_repository.dart';
import 'package:myeg_test/services/http_service.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  ProductRepository? _productRepository;

  void setupRepositories() {
    // Create Dio instance with base configuration
    final dio = Dio()
      ..options.baseUrl = stgUrl
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

    // Create the API client
    final apiClient = ApiClient(dio);
    _productRepository = ProductImplp(apiClient);
  }

  ProductRepository get productRepository {
    if (_productRepository == null) {
      setupRepositories();
    }
    return _productRepository!;
  }
}
