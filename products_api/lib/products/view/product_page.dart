import 'package:flutter/material.dart';
import 'package:products_api/products/model/services/product_service.dart';
import 'package:products_api/products/states/product_state.dart';
import 'package:products_api/products/stores/product_store.dart';
import 'package:uno/uno.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final store = ProductStore(service: ProductService(uno: Uno()));

  @override
  void initState() {
    super.initState();
    store.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Product API")),
        body: ValueListenableBuilder(
          valueListenable: store,
          builder: (_, state, child) {
            if (state is LoadingProductState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ErrorProductState) {
              return Center(child: Text(state.message));
            }
            if (state is SuccessProductState) {
              return ListView.builder(
                  itemCount: store.products.length,
                  itemBuilder: (_, index) {
                    final product = store.products[index];
                    return ListTile(title: Text(product.title));
                  });
            }

            return Container();
          },
        ));
  }
}
