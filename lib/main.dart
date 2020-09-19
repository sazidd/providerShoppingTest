import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_test/page/productListPage.dart';
import 'package:provider_shopping_test/store/myStore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductListPage(),
      ),
    );
  }
}
