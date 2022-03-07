import 'package:products_api/products/core/dtos/product_dto.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class SuccessProductState extends ProductState {
  late final List<ProductDto> products;
  SuccessProductState({
    required this.products,
  });
}

class ErrorProductState extends ProductState {
  late final String message;
  ErrorProductState(this.message);
}

class LoadingProductState extends ProductState {}
