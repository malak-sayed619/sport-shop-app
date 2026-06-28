import 'package:flutter/material.dart';
import 'package:sport_shop_app/widgets/bottombar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _SectionTitle(title: "GENERAL"),
          _SettingsCard(
            children: [
              _SwitchItem(
                icon: Icons.dark_mode_outlined,
                label: "Dark Mode",
                value: darkMode,
                onChanged: (val) => setState(() => darkMode = val),
              ),
              const Divider(height: 1),
              _SwitchItem(
                icon: Icons.notifications_none,
                label: "Notifications",
                value: notifications,
                onChanged: (val) => setState(() => notifications = val),
              ),
              const Divider(height: 1),
              _SettingsItem(
                icon: Icons.language,
                label: "Language",
                trailingText: "English",
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 24),

          const _SectionTitle(title: "ACCOUNT"),
          _SettingsCard(
            children: [
              _SettingsItem(
                icon: Icons.lock_outline,
                label: "Change Password",
                onTap: () {},
              ),
              const Divider(height: 1),
              _SettingsItem(
                icon: Icons.shield_outlined,
                label: "Privacy Policy",
                onTap: () {},
              ),
              const Divider(height: 1),
              _SettingsItem(
                icon: Icons.description_outlined,
                label: "Terms of Service",
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 24),

          const _SectionTitle(title: "ABOUT"),
          _SettingsCard(
            children: [
              _SettingsItem(
                icon: Icons.info_outline,
                label: "Version",
                trailingText: "1.0.0",
                onTap: null, // مجرد عرض معلومة، بدون تنقل
              ),
            ],
          ),

          const SizedBox(height: 24),

          _SettingsCard(
            children: [
              _SettingsItem(
                icon: Icons.logout,
                label: "Logout",
                iconColor: Colors.red,
                labelColor: Colors.red,
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 3),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final List<Widget> children;
  const _SettingsCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}

class _SwitchItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade700),
      title: Text(label, style: const TextStyle(fontSize: 15)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blue,
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? trailingText;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? labelColor;

  const _SettingsItem({
    required this.icon,
    required this.label,
    this.trailingText,
    this.onTap,
    this.iconColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: iconColor ?? Colors.grey.shade700),
      title: Text(
        label,
        style: TextStyle(fontSize: 15, color: labelColor ?? Colors.black87),
      ),
      trailing: trailingText != null
          ? Text(trailingText!, style: TextStyle(color: Colors.grey.shade600))
          : (onTap != null
                ? Icon(Icons.chevron_right, color: Colors.grey.shade400)
                : null),
    );
  }
}
