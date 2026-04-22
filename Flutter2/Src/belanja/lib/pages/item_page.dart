import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;
  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'item-${item.name}',
              child: Image.network(
                item.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text('Nama: ${item.name}'),
            Text('Harga: Rp ${item.price}'),
            Text('Stok: ${item.stock}'),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text('${item.rating}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}