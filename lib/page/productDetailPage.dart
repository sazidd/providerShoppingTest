import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_test/store/myStore.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        actions: [
          Text(store.getBasketQty().toString()),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset(
                store.activeProduct.pic,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                store.activeProduct.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                store.activeProduct.price.toString(),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                ),
              ),
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      store.addOneItemToBasket(store.activeProduct);
                    },
                  ),
                  Container(
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        store.activeProduct.qty.toString(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      store.removeOneItemToBasket(store.activeProduct);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
