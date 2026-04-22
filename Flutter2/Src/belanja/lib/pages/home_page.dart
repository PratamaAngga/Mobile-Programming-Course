import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Item> items = const [
    Item(
      name: 'Sugar',
      price: 5000,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa_SWmy6ilqlV5_EJRqJCDkqFhTHh-dEcfsg&s',
      stock: 10,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS08NDQLL-W6ALz3T47pOhakn1POaOsK7akDA&s',
      stock: 20,
      rating: 4.2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belanja'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemCard(item: item);
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.amber,
        padding: const EdgeInsets.all(12),
        child: const Text(
          'Pratama Angga Saputra — 244107060113',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}