import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

// Define theme colors
const Color primaryColor = Color(0xFF6B5B95);
const Color secondaryColor = Color(0xFF4682B4);
const Color backgroundColor = Color(0xFFF0F2F5);
const Color cardColor = Colors.white;

class InitiativesPage extends StatelessWidget {
  const InitiativesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerClass(),
      appBar: _buildAppBar(),
      backgroundColor: backgroundColor,
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Initiatives",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: primaryColor,
      elevation: 2,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildInitiativesGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildInitiativesGrid() {
    final List<Map<String, dynamic>> initiatives = [
      {
        'image': 'assets/initiatives1.png',
        'title': 'Human Capital and Leadership Initiative',
        'icon': Icons.people_outline,
      },
      {
        'image': 'assets/initiatives2.png',
        'title': 'India Data Portal',
        'icon': Icons.data_usage_outlined,
      },
      {
        'image': 'assets/initiatives1.png',
        'title': 'Legislative Support Programme',
        'icon': Icons.gavel_outlined,
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: initiatives.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return InitiativeCard(
          image: initiatives[index]['image'] as String,
          title: initiatives[index]['title'] as String,
          icon: initiatives[index]['icon'] as IconData,
        );
      },
    );
  }
}

class InitiativeCard extends StatelessWidget {
  final String image;
  final String title;
  final IconData icon;

  const InitiativeCard({
    Key? key,
    required this.image,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            // Handle card tap
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Image
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                // Gradient Overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        primaryColor.withOpacity(0.9),
                        primaryColor.withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            icon,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}