import 'package:flutter/cupertino.dart';
import 'package:provider_shopping_test/model/product.dart';

class MyStore extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _baskets = [];

  Product _activeProduct = null;

  MyStore() {
    _products = [
      Product(
          id: 1,
          qty: 1,
          name: "Razer Kraken x",
          price: 4500,
          pic: "assets/headset.jpg"),
      Product(
          id: 2,
          qty: 1,
          name: "Razer Kraken ",
          price: 4500,
          pic: "assets/headset.jpg"),
      Product(
          id: 3,
          qty: 1,
          name: "Razer Kraken ultimate",
          price: 4500,
          pic: "assets/headset.jpg"),
      Product(
          id: 4,
          qty: 1,
          name: "Razer Kraken v2",
          price: 4500,
          pic: "assets/headset.jpg"),
    ];
    notifyListeners();
  }

  List<Product> get products => _products;
  List<Product> get baskets => _baskets;

  Product get activeProduct => _activeProduct;

  setActiveProduct(Product p) {
    _activeProduct = p;
  }

  addOneItemToBasket(Product p) {
    Product found = _baskets.firstWhere(
      (a) => a.id == p.id,
      orElse: () => null,
    );
    if (found != null) {
      found.qty += 1;
    } else {
      _baskets.add(p);
    }
    notifyListeners();
  }

  removeOneItemToBasket(Product p) {
    Product found = _baskets.firstWhere(
      (a) => a.id == a.id,
      orElse: () => null,
    );
    if (found != null && found.qty == 1) {
      _baskets.remove(p);
    } else {
      found.qty -= 1;
    }
    notifyListeners();
  }

  getBasketQty() {
    int total = 0;
    for (int i = 0; i < baskets.length; i++) {
      total += baskets[i].qty;
    }
    return total;
  }
}
