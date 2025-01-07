import 'package:flutter/material.dart';

import 'allProducts.dart';
import 'cartPage.dart';
import 'productDetails.dart';
import 'productListpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> featuredProducts = const [
    {
      'name': 'Gaming Laptop',
      'price': '\$1200',
      'image': 'lib/assets/gaming_laptop.jpg'
    },
    {'name': 'Earbuds', 'price': '\$150', 'image': 'lib/assets/earbuds.jpg'},
    {
      'name': 'Smartwatch',
      'price': '\$250',
      'image': 'lib/assets/smartwatch.jpg'
    },
  ];

  final List<Map<String, String>> bestSellers = const [
    {'name': 'iPhone 14', 'price': '\$999', 'image': 'lib/assets/iphone14.jpg'},
    {
      'name': '4K Smart TV',
      'price': '\$1800',
      'image': 'lib/assets/smartTv.jpg'
    },
    {'name': 'Speaker', 'price': '\$120', 'image': 'lib/assets/speaker.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ShopSphere",
          style:
              TextStyle(color: Color(0xFF11998E), fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Color(0xFF11998E),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome to ShopSphere!",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Find the best deals on your favorite products.",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllProductsPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF11998E),
                    ),
                    child: const Text("Shop Now"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                "Categories",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  CategoryCard(
                      icon: Icons.laptop,
                      label: "Laptops",
                      category: "Laptops"),
                  CategoryCard(
                      icon: Icons.phone_iphone,
                      label: "Phones",
                      category: "Phones"),
                  CategoryCard(
                      icon: Icons.headphones,
                      label: "Headphones",
                      category: "Headphones"),
                  CategoryCard(
                      icon: Icons.watch, label: "Watches", category: "Watches"),
                  CategoryCard(icon: Icons.tv, label: "TVs", category: "TVs"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text("Featured Products",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: featuredProducts.map((product) {
                  return ProductCard(product: product);
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text("Best Sellers",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: bestSellers.map((product) {
                  return ProductCard(product: product);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, String> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailsPage(product: product)),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product['image']!,
                height: 100, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(product['name']!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 5),
            Text(product['price']!,
                style: const TextStyle(fontSize: 14, color: Color(0xFF11998E))),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String category;

  const CategoryCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListPage(category: category),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF11998E),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
