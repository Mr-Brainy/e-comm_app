import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class CartListPage extends StatelessWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = (Provider.of<CartProvider>(context).cart);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 32.0,
              backgroundColor: const Color.fromRGBO(245, 247, 249, 1),
              backgroundImage: AssetImage(
                cartItem['imageUrl'].toString(),
              ),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text('Size: ${cartItem['size']}'),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Are you sure to delete?'),
                        content: const Text('Confirm your option👇'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CartProvider>()
                                  .removeProduct(cartItem);
                              // Provider.of<CartProvider>(context).removeProduct(cartItem);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red[700],
              ),
            ),
          );
        },
      ),
    );
  }
}
