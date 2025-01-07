import 'package:flutter/material.dart';

import 'productDetails.dart';

class ProductListPage extends StatelessWidget {
  final String category;

  const ProductListPage({super.key, required this.category});

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
    List<Map<String, String>> filteredProducts =
        products.where((product) => product['category'] == category).toList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          category,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF11998E),
      ),
      body: filteredProducts.isEmpty
          ? const Center(
              child: Text(
                "No products found in this category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsPage(product: product),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10)),
                          child: Image.asset(
                            product['image']!,
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: double.infinity,
                                height: 180,
                                color: Colors.grey[300],
                                child: const Icon(Icons.image_not_supported,
                                    size: 50, color: Colors.grey),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                product['price']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF11998E),
                                  fontWeight: FontWeight.w600,
                                ),
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
    );
  }
}
