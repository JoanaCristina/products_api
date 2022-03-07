import 'package:products_api/products/core/dtos/product_dto.dart';

import 'package:products_api/products/model/services/product_interface.dart';
import 'package:uno/uno.dart';

class ProductService implements IProduct {
  final Uno uno;
  //final Dio dio;

  ProductService({required this.uno});

  @override
  Future<List<ProductDto>> fetchProducts() async {
    final response = await uno.get('http://localhost:3031/products');
    final list = response.data as List;
    final products =
        list.map((product) => ProductDto.fromMap(product)).toList();
    return products;
  }
}
