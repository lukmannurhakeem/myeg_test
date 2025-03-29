import 'package:myeg_test/constants/endpoint_constant.dart';
import 'package:myeg_test/model/product_model.dart';
import 'package:myeg_test/repositories/product/product_repository.dart';
import 'package:myeg_test/services/http_service.dart';

class ProductImplp implements ProductRepository {
  final ApiClient _apiClient;
  ProductImplp(this._apiClient);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _apiClient.get(EndpointConstant.products);
    final List<dynamic> data = response.data;
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
