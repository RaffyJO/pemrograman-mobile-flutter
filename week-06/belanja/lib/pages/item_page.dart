import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemArgs = GoRouterState.of(context).extra as Item;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(itemArgs.name),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Hero(
                tag: itemArgs.name,
                child: Image.network(
                  itemArgs.photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(itemArgs.name),
            Text('Rp ${itemArgs.price}'),
            Text('Stock: ${itemArgs.stock}'),
            Text('Rating: ${itemArgs.rating}'),
          ],
        ),
      ),
    );
  }
}
