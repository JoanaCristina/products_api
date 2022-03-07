import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_api/products/model/services/product_service.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}
class RequestMock extends Mock implements Request {}

void main() {
  final unoMock = UnoMock();
  final service = ProductService(uno: unoMock);
  testWidgets('should get all the products', (tester) async {
    when(() => unoMock.get(any()))
    .thenAnswer((_) async=> Response(
      headers: {}, 
      request: RequestMock(), 
      status: 200, 
      data: jsonResponse));


    final products = await service.fetchProducts();

    expect(products[0].title, "Flutter 2");
  });
}

final jsonResponse = jsonDecode(
    r''' 
[
  {"id": "0", "title": "Flutter 2"},
  {"id": "1", "title": "React Native"},
  {"id": "2", "title": "Ionic"}
]
''');
