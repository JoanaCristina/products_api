import 'package:products_api/products/core/dtos/product_dto.dart';

abstract class IProduct {
  Future<List<ProductDto>> fetchProducts();
}
