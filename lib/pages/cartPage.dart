import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cartProvider.dart';
import 'paymentPage.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            'Cart',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF11998E)),
      body: cart.cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                var item = cart.cartItems[index];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item['image']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image_not_supported,
                                size: 30, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                    title: Text(
                      item['name']!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      item['price']!,
                      style: const TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       
                        IconButton(
                          icon: const Icon(Icons.remove_circle,
                              color: Color.fromARGB(255, 101, 101, 101)),
                          onPressed: () {
                            cart.decreaseQuantity(item);
                          },
                        ),
                        Text(
                          '${item['quantity']}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        
                        IconButton(
                          icon: const Icon(Icons.add_circle,
                              color: Color.fromARGB(255, 101, 101, 101)),
                          onPressed: () {
                            cart.increaseQuantity(item);
                          },
                        ),
                      
                        IconButton(
                          icon: const Icon(Icons.delete,
                              color: Color.fromARGB(200, 255, 0, 0)),
                          onPressed: () {
                            cart.removeFromCart(item);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.cartItems.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Color(0xFF11998E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Proceed to Payment',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
    );
  }
}
