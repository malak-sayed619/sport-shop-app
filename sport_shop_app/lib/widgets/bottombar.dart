import 'package:flutter/material.dart';
import 'package:sport_shop_app/features/allproduct.dart';
import 'package:sport_shop_app/features/discover.dart';
import 'package:sport_shop_app/features/profile.dart';
import 'package:sport_shop_app/features/setting.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, this.currentIndex = 0});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  void _onItemTapped(BuildContext context, int index) {
    if (index == widget.currentIndex) return;

    Widget page;

    switch (index) {
      case 0:
        page = const DiscoverScreen();
        break;
      case 1:
        page = const AllProductsScreen();
        break;
      case 2:
        page = const ProfileScreen();
        break;
      case 3:
        page = const SettingsScreen();
        break;

      default:
        return;
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            label: "Home",
            isSelected: widget.currentIndex == 0,
            onTap: () => _onItemTapped(context, 0),
          ),
          _NavItem(
            icon: Icons.shopping_bag_outlined,
            label: "Shop",
            isSelected: widget.currentIndex == 1,
            onTap: () => _onItemTapped(context, 1),
          ),
          _NavItem(
            icon: Icons.person_outline,
            label: "Profile",
            isSelected: widget.currentIndex == 2,
            onTap: () => _onItemTapped(context, 2),
          ),
          _NavItem(
            icon: Icons.settings_outlined,
            label: "Settings",
            isSelected: widget.currentIndex == 3,
            onTap: () => _onItemTapped(context, 3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.blue : Colors.grey, size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
