import 'package:flutter/material.dart';
import '../page/aboutus.dart';
import '../page/contactus.dart';
import '../page/initiatives.dart';
import '../page/partnerships_associations.dart';
import '../splashscreen/home_screen.dart';

// Define theme colors
const Color primaryColor = Color(0xFF6B5B95); // Purple
const Color secondaryColor = Color(0xFF4682B4); // Steel Blue
const Color backgroundColor = Color(0xFFF0F2F5);
const Color cardColor = Colors.white;

class DrawerClass extends StatefulWidget {
  const DrawerClass({super.key});

  @override
  State<DrawerClass> createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            _buildDrawerHeader(),
            Expanded(child: _buildDrawerItems()),
            _buildDrawerFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryColor, secondaryColor],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/logo.png"),
              radius: 45,
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "IBS",
            style: TextStyle(
              fontSize: 28,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildDrawerItems() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 12),
      shrinkWrap: true,
      children: [
        _buildDrawerItem(
          icon: Icons.home_rounded,
          title: 'Home',
          onTap: () => _navigateToPage(const HomeScreen(title: 'AIIMS')),
        ),
        _buildDrawerItem(
          icon: Icons.info_outline_rounded,
          title: 'About Us',
          onTap: () => _navigateToPage(const AboutPage()),
        ),
        _buildDrawerItem(
          icon: Icons.lightbulb_outline_rounded,
          title: 'Initiatives',
          onTap: () => _navigateToPage(const InitiativesPage()),
        ),
        _buildDrawerItem(
          icon: Icons.handshake_outlined,
          title: 'Partnerships and Associations',
          onTap: () => _navigateToPage(PartnershipsAssociationsPage()),
        ),
        _buildDrawerItem(
          icon: Icons.contact_mail_rounded,
          title: 'Contact Us',
          onTap: () => _navigateToPage(ContactPage()),
        ),
      ],
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: primaryColor, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: secondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: secondaryColor,
          ),
        ),
        onTap: () {
          onTap();
          _showSnackBar(title);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget _buildDrawerFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          Divider(color: primaryColor.withOpacity(0.2), thickness: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _navigateToPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void _showSnackBar(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Text(
              'Navigating to $title',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: primaryColor,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
