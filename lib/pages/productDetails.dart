import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cartProvider.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product['image'],
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover, //
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 200),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              product['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product['price'],
              style: const TextStyle(fontSize: 20, color: Color(0xFF11998E)),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  cart.addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Item added to cart!")),
                  );
                },
                icon: const Icon(
                  Icons.add_shopping_cart,
                  color: Color(0xFF11998E),
                ),
                label: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Color(0xFF11998E)),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
