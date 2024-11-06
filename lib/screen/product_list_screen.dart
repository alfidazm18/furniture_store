// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../widget/product_card.dart';
import '../widget/category_button.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String selectedCategory = 'Chairs';
  bool isCartSelected = false; // Status ikon keranjang

  final List<Map<String, String>> sofas = [
    {'imageUrl': 'assets/sofa.jpg', 'name': 'Modern Sofa', 'price': '\$99.99'},
    {'imageUrl': 'assets/sofa2.jpg', 'name': 'Luxury Sofa', 'price': '\$149.99'},
  ];

  final List<Map<String, String>> chairs = [
    {'imageUrl': 'assets/chair3.jpg', 'name': 'Soft Element Jack', 'price': '\$57.50'},
    {'imageUrl': 'assets/chair2.jpg', 'name': 'Leset Galant', 'price': '\$64.00'},
    {'imageUrl': 'assets/chair1.jpg', 'name': 'Chester Chair', 'price': '\$61.00'},
    {'imageUrl': 'assets/chair4.jpg', 'name': 'Avrora Chair', 'price': '\$47.50'},
  ];

  final List<Map<String, String>> tables = [
    {'imageUrl': 'assets/table1.jpg', 'name': 'Console Table', 'price': '\$110.99'},
    {'imageUrl': 'assets/table2.jpg', 'name': 'Dining Table', 'price': '\$130.99'},
  ];

  final List<Map<String, String>> kitchen = [
    {'imageUrl': 'assets/kitchen1.jpg', 'name': 'Kitchen Cabinet', 'price': '\$320.99'},
    {'imageUrl': 'assets/kitchen2.jpg', 'name': 'Bar Stool', 'price': '\$160.89'},
  ];

  @override
  Widget build(BuildContext context) {
    // Menentukan produk yang akan ditampilkan berdasarkan kategori yang dipilih
    List<Map<String, String>> products;
    if (selectedCategory == 'Sofas') {
      products = sofas;
    } else if (selectedCategory == 'Tables') {
      products = tables;
    } else if (selectedCategory == 'Kitchen') {
      products = kitchen;
    } else {
      products = chairs;
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Discover products'),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: isCartSelected ? Colors.black : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  isCartSelected = !isCartSelected; // Toggle status keranjang
                });
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryButton(
                  label: 'Sofas',
                  isSelected: selectedCategory == 'Sofas',
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Sofas';
                    });
                  },
                ),
                CategoryButton(
                  label: 'Chairs',
                  isSelected: selectedCategory == 'Chairs',
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Chairs';
                    });
                  },
                ),
                CategoryButton(
                  label: 'Tables',
                  isSelected: selectedCategory == 'Tables',
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Tables';
                    });
                  },
                ),
                CategoryButton(
                  label: 'Kitchen',
                  isSelected: selectedCategory == 'Kitchen',
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Kitchen';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Discover $selectedCategory',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.7,
                children: products.map((product) {
                  return ProductCard(
                    imageUrl: product['imageUrl']!,
                    name: product['name']!,
                    price: product['price']!,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
} 