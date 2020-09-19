import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_test/page/productDetailPage.dart';
import 'package:provider_shopping_test/store/myStore.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    print(store.products[0].name);
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: GridView.builder(
        itemCount: store.products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            store.setActiveProduct(store.products[i]);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                width: 100,
                height: 150,
                child: Image.asset(
                  store.products[i].pic,
                ),
              ),
              Text(
                store.products[i].name,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
