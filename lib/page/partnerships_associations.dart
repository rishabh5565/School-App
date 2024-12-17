import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

const Color primaryColor = Color(0xFF6B5B95);
const Color secondaryColor = Color(0xFF4682B4);
const Color backgroundColor = Color(0xFFF0F2F5);
const Color cardColor = Colors.white;

class PartnershipsAssociationsPage extends StatelessWidget {
  const PartnershipsAssociationsPage({super.key});

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
        "Partnerships & Associations",
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroSection(),
          const SizedBox(height: 24),
          _buildSections(),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Our Network",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Building Strong Educational Partnerships",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSections() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFoundingSchools(),
          const SizedBox(height: 32),
          _buildAssociateSchools(),
          const SizedBox(height: 32),
          _buildAccreditation(),
        ],
      ),
    );
  }

  Widget _buildFoundingSchools() {
    return _buildSectionWithImages(
      title: 'Founding Schools',
      description:
          'Our pioneering educational institutions that set the foundation.',
      images: ['assets/founding_schools1.png', 'assets/founding_schools.png'],
    );
  }

  Widget _buildAssociateSchools() {
    return _buildSectionWithImages(
      title: 'Associate Schools',
      description: 'Partner institutions that share our vision and values.',
      images: ['assets/associate_schools.png', 'assets/associate_schools1.png'],
    );
  }

  Widget _buildAccreditation() {
    return _buildSectionWithImages(
      title: 'Accreditation',
      description:
          'Recognition and certifications from leading educational bodies.',
      images: [
        'assets/accreditation.png',
        'assets/accreditation1.png',
        'assets/accreditation2.png',
      ],
    );
  }

  Widget _buildSectionWithImages({
    required String title,
    required String description,
    required List<String> images,
  }) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          // Images Grid
          SizedBox(
            height: 220, // Increased height for better visibility
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index != images.length - 1 ? 16 : 0,
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9, // Standard aspect ratio for images
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                images[index],
                                fit: BoxFit.contain, // Changed to contain
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: const Center(
                                      child: Icon(
                                        Icons.error_outline,
                                        color: Colors.grey,
                                        size: 32,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      primaryColor.withOpacity(0.3),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'View Details',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, color: primaryColor, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
