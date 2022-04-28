import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView(
        children: [
          ProductBox(
            name: 'IPhone 13',
            description: 'This is a new Iphone 13 phone',
            price: 1500,
            image: 'iphone.png',
          ),
          ProductBox(
            name: 'Oppo Reno',
            description: 'This is a new Oppo Reno phone',
            price: 1000,
            image: 'oppo.png',
          ),
          ProductBox(
            name: 'Samsung',
            description: 'This is a new Samsung phone',
            price: 1000,
            image: 'samsung.png',
          ),
          ProductBox(
            name: 'Redmi Note',
            description: 'This is a new Redmi Note phone',
            price: 1000,
            image: 'xiaomi.png',
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  late String name;
  late String description;
  late double price;
  late String image;

  ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      height: 150,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Image.asset('images/$image')),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(description),
                    Text('USD $price'),
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
