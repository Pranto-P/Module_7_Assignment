import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List products = [
    Product(name: 'Product 1', price: 20),
    Product(name: 'Product 2', price: 20),
    Product(name: 'Product 3', price: 20),
    Product(name: 'Product 4', price: 20),
    Product(name: 'Product 5', price: 20),
    Product(name: 'Product 6', price: 20),
    Product(name: 'Product 7', price: 20),
    Product(name: 'Product 8', price: 20),
    Product(name: 'Product 9', price: 20),
    Product(name: 'Product 10', price: 20),
    Product(name: 'Product 11', price: 20),
    Product(name: 'Product 12', price: 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('Price: \$${products[index].price}'),
            trailing: Button(
              onBuyPressed: () {
                setState(() {
                  products[index].increMent();
                  if (products[index].counter == 5) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Congratulations!'),
                          content: Text('You\'ve bought 5 ${products[index].name}!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Card(products: products)),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Product {
  final String name;
  final int price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});

  void increMent() {
    counter++;
  }
}

class Button extends StatelessWidget {
  final  onBuyPressed;

  Button({required this.onBuyPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Text("counter :"),
        ElevatedButton(
        onPressed: onBuyPressed,
        child: Text('Buy Now'),
      ),
    ]);
  }
}

class Card extends StatelessWidget {
  final  products;

  Card({required this.products});

  @override
  Widget build(BuildContext context) {
    int totalBought = products.fold(0, (sum, product) => sum + product.counter);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total Bought: $totalBought'),
      ),
    );
  }
}
