import 'package:flutter/material.dart';
import 'package:sport_shop_app/widgets/bottombar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          const SizedBox(height: 10),

          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue.shade100,
              child: const Text(
                "JD",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          const Center(
            child: Text(
              "John Doe",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              "john.doe@flutter.dev",
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          const SizedBox(height: 16),

          Center(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: const BorderSide(color: Colors.blue),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
              ),
              child: const Text("Edit Profile"),
            ),
          ),
          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _StatItem(
                icon: Icons.inventory_2_outlined,
                value: "12",
                label: "ORDERS",
              ),
              _StatItem(
                icon: Icons.favorite_border,
                value: "5",
                label: "WISHLIST",
              ),
              _StatItem(icon: Icons.star_border, value: "3", label: "REVIEWS"),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),

          _ProfileMenuItem(
            icon: Icons.inventory_2_outlined,
            label: "My Orders",
            onTap: () {},
          ),
          _ProfileMenuItem(
            icon: Icons.favorite_border,
            label: "Favorites",
            onTap: () {},
          ),
          _ProfileMenuItem(
            icon: Icons.payment_outlined,
            label: "Payment Methods",
            onTap: () {},
          ),
          _ProfileMenuItem(
            icon: Icons.help_outline,
            label: "Help Centre",
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 26),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.grey.shade500),
      title: Text(
        label,
        style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
      contentPadding: EdgeInsets.zero,
    );
  }
}
