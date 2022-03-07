import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_api/products/model/services/product_interface.dart';
import 'package:products_api/products/states/product_state.dart';
import 'package:products_api/products/stores/product_store.dart';

class ProductServerMock extends Mock implements IProduct {}

void main() {
  final _service = ProductServerMock();
  final store = ProductStore(service: _service);
  testWidgets('should change the state to success', (tester) async {
    when(() => _service.fetchProducts()).thenAnswer((_) async => []);
    await store.fetchProducts();
    expect(store.value, isA<SuccessProductState>());
  });

  testWidgets('should change the state to error', (tester) async {
    when(() => _service.fetchProducts())
        .thenThrow(Exception('Error when trying to retrieve the products'));
    await store.fetchProducts();
    expect(store.value, isA<ErrorProductState>());
  });


}
