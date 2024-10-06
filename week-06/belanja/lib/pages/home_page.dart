import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      photo:
          'https://tse4.mm.bing.net/th?id=OIP.BQ9JkWVKIOSq4eIahlT5AgHaE8&pid=Api&P=0&h=180',
      stock: 10,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      photo: 'https://static.toiimg.com/photo/68483689.cms',
      stock: 5,
      rating: 3.5,
    ),
  ];

  Widget footerSection = Container(
    padding: const EdgeInsets.all(8),
    child: const Text(
      'Nama: Raffy Jamil Octavialdy\nNIM: 2241720082\n',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                ),
                padding: const EdgeInsets.all(8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return InkWell(
                    onTap: () {
                      context.go('/item', extra: item);
                    },
                    child: Card(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Hero(
                                tag: item.name,
                                child: Image.network(
                                  item.photo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(item.name),
                            Text('Rp ${item.price}'),
                            Text('Stock: ${item.stock}'),
                            Text('Rating: ${item.rating}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          footerSection,
        ],
      ),
    );
  }
}
