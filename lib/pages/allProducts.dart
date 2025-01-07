import 'package:flutter/material.dart';
import 'productDetails.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Gaming Laptop',
      'price': '\$1200',
      'image': 'lib/assets/gaming_laptop.jpg',
      'category': 'Laptops'
    },
    {
      'name': 'Wireless Earbuds',
      'price': '\$150',
      'image': 'lib/assets/earbuds.jpg',
      'category': 'Earbuds'
    },
    {
      'name': 'Smartwatch',
      'price': '\$250',
      'image': 'lib/assets/smartwatch.jpg',
      'category': 'Watches'
    },
    {
      'name': 'iPhone 14',
      'price': '\$999',
      'image': 'lib/assets/iphone14.jpg',
      'category': 'Phones'
    },
    {
      'name': '4K Smart TV',
      'price': '\$1800',
      'image': 'lib/assets/smartTv.jpg',
      'category': 'TVs'
    },
    {
      'name': 'Bluetooth Speaker',
      'price': '\$120',
      'image': 'lib/assets/speaker.jpg',
      'category': 'Speakers'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            "All Products",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF11998E)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, 
          ),
          itemBuilder: (context, index) {
            var product = products[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: product),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10)),
                        child: Image.asset(
                          product['image']!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.image_not_supported,
                                  size: 40, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            product['name']!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            product['price']!,
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xFF11998E)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
