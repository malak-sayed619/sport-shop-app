import 'package:flutter/material.dart';
import 'package:sport_shop_app/widgets/bottombar.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F7F9),
        elevation: 0,
        titleSpacing: 20,
        title: const Text(
          "All Products",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          children: const [
            allproduct(
              icon: Icons.sports_soccer,
              color: Colors.green,
              name: "Pro Soccer Ball",
              description: "FIFA approved match ball",
              price: 29.99,
              imageUrl:
                  "https://images.unsplash.com/photo-1521412644187-c49fa049e84d",
            ),
            SizedBox(height: 16),
            allproduct(
              icon: Icons.directions_run,
              color: Colors.red,
              name: "Runner X1",
              description: "Lightweight running shoes",
              price: 89.99,
              imageUrl:
                  "https://images.unsplash.com/photo-1460353581641-37baddab0fa2",
            ),
            SizedBox(height: 16),
            allproduct(
              icon: Icons.checkroom,
              color: Colors.purple,
              name: "Classic Jersey",
              description: "Breathable fabric",
              price: 45.00,
              imageUrl:
                  "https://images.unsplash.com/photo-1522778119026-d647f0596c20",
            ),
            SizedBox(height: 16),
            allproduct(
              icon: Icons.backpack,
              color: Colors.blue,
              name: "Gym Duffle Bag",
              price: 35.50,
              description: "Water-resistant with shoe compartment",
              imageUrl:
                  "https://images.unsplash.com/photo-1622560480654-d96214fdc887",
            ),
            SizedBox(height: 16),
            allproduct(
              icon: Icons.sports_tennis,
              color: Color.fromARGB(255, 243, 33, 96),
              name: "Pro Tennis Racket",
              price: 120.50,
              description: "Carbon fiber frame",
              imageUrl:
                  "https://images.pexels.com/photos/209977/pexels-photo-209977.jpeg",
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
    );
  }
}

class allproduct extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const allproduct({
    super.key,
    required this.icon,
    required this.color,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: color.withOpacity(0.1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(icon, size: 38, color: color);
                },
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 10),
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(14),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
