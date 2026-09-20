import 'package:flutter/material.dart';
import 'package:flutter_learing_codepur/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: () {
            print('${item.name} pressed');
          },
          leading: Image.network(item.image.toString()),
          title: Text(item.name.toString()),
          subtitle: Text(item.desc.toString()),
          trailing: Text(
            '\$${item.price.toString()}',
            textScaler: TextScaler.linear(1.2),
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
