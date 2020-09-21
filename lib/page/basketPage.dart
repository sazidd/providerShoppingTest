import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_test/store/myStore.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("basket"),
        actions: [
          Text(
            store.getBasketQty().toString(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: store.baskets.length,
        itemBuilder: (context, index) => Row(
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset(
                store.baskets[index].pic,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                store.baskets[index].name,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        store.addOneItemToBasket(
                          store.baskets[index],
                        );
                      },
                    ),
                    Container(
                      width: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Text(
                        store.baskets[index].qty.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        store.removeOneItemToBasket(
                          store.baskets[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
