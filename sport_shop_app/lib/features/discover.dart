import 'package:flutter/material.dart';
import 'package:sport_shop_app/widgets/bottombar.dart';
import 'package:sport_shop_app/widgets/navigation.dart';
import 'package:sport_shop_app/core/auth/signin.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Text(
                "Discover",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search shoes...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color(0xFFF2F2F4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  CategoryChip(text: "Shoes"),
                  SizedBox(width: 10),
                  CategoryChip(text: "Jerseys"),
                  SizedBox(width: 10),
                  CategoryChip(text: "Balls"),
                  SizedBox(width: 10),
                  CategoryChip(text: "Accessories"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "Popular Items",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
              child: GridView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                children: [
                  ProductCard(
                    name: "Trail Shoes",
                    price: 75.00,
                    icon: Icons.directions_run,
                    color: Colors.orange,
                    image: Image.network(
                      "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77",
                    ),
                  ),

                  ProductCard(
                    name: "Formal Shoes",
                    price: 65.00,
                    icon: Icons.directions_run,
                    color: Colors.deepPurple,
                    image: Image.network(
                      "https://images.unsplash.com/photo-1614252235316-8c857d38b5f4",
                    ),
                  ),
                  ProductCard(
                    name: "Running Shoes",
                    price: 110.00,
                    icon: Icons.directions_run,
                    color: Colors.brown,
                    image: Image.network(
                      "https://images.unsplash.com/photo-1460353581641-37baddab0fa2",
                    ),
                  ),
                  ProductCard(
                    name: "Sneakers",
                    price: 49.99,
                    icon: Icons.directions_run,
                    color: Colors.teal,
                    image: Image.network(
                      "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String text;

  const CategoryChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final IconData icon;
  final Color color;
  final Image? image;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
    required this.color,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                  child: Container(
                    width: double.infinity,
                    color: color.withOpacity(0.15),
                    child: image != null
                        ? Image(
                            image: image!.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )
                        : Icon(icon, size: 60, color: color),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart, size: 16),
                    label: const Text("Add"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 243, 243, 255),
                      foregroundColor: Colors.blue,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
