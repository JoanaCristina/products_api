import 'package:flutter/material.dart';
import 'package:products_api/products/core/dtos/product_dto.dart';
import 'package:products_api/products/model/services/product_interface.dart';
import 'package:products_api/products/states/product_state.dart';

class ProductStore extends ValueNotifier<ProductState> {
  final IProduct service;
  late List<ProductDto> products;

  ProductStore({required this.service}) : super(InitialProductState());

  Future fetchProducts() async {
    value = LoadingProductState();
    try {
      products = await service.fetchProducts();
      value = SuccessProductState(products: products);
    } catch (e) {
      value = ErrorProductState(
          'Error when trying to retrieve the products: ${e.toString()}');
    }
  }
}
