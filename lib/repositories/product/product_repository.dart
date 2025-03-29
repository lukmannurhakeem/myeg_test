import 'package:myeg_test/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
}
