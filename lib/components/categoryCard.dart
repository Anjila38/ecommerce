import 'package:flutter/material.dart';

import '../pages/productListpage.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String category;

  const CategoryCard({super.key, required this.icon, required this.label, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductListPage(category: category)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueAccent,
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
