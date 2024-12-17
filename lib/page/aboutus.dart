import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

// Use the same theme colors as defined earlier
const Color primaryColor = Color(0xFF6B5B95);
const Color secondaryColor = Color(0xFF4682B4);
const Color backgroundColor = Color(0xFFF0F2F5);
const Color cardColor = Colors.white;

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerClass(),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "About ISB",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [primaryColor, secondaryColor],
          ),
        ),
      ),
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeroSection(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAboutSection(),
                const SizedBox(height: 24),
                _buildVisionSection(),
                const SizedBox(height: 24),
                _buildMissionSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryColor.withOpacity(0.9), // Using primaryColor (purple)
            secondaryColor.withOpacity(
              0.9,
            ), // Using secondaryColor (steel blue)
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background pattern (optional)
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              backgroundBlendMode: BlendMode.overlay,
            ),
          ),

          // Image container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/heroimage.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor.withOpacity(
                    0.3,
                  ), // Top overlay using primaryColor
                  Colors.transparent, // Middle transparent
                  secondaryColor.withOpacity(
                    0.3,
                  ), // Bottom overlay using secondaryColor
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return _buildContentCard(
      icon: Icons.school,
      title: 'About ISB',
      content:
          "The Indian School of Business (ISB) evolved from a need for a world-class business school in Asia. The founders, some of the best minds from the corporate and academic worlds, foresaw the leadership needs of emerging economies, particularly the need for young leaders with a global perspective. ISB is committed to creating such leaders. \nFunded entirely by private corporations, foundations, and individuals from around the world who believe in its vision, ISB is a not-for-profit organisation. \nIt has the distinction of carrying a ‘triple crown’ — accreditations from the AMBA, the EFMD Quality Improvement System (EQUIS), and the Association to Advance Collegiate Schools of Business (AACSB).",
    );
  }

  Widget _buildVisionSection() {
    return _buildContentCard(
      icon: Icons.visibility,
      title: 'Our Vision',
      content:
          "ISB's vision is to be an internationally top-ranked, research-driven, independent management institution that grooms future leaders for India and the world.",
    );
  }

  Widget _buildMissionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Mission',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryColor,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            // Adjust cards layout based on screen width
            return width > 600 ? _buildWideGridView() : _buildNarrowGridView();
          },
        ),
      ],
    );
  }

  Widget _buildWideGridView() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1, // Increased from 0.85
      children: _buildMissionCards(),
    );
  }

  List<Widget> _buildMissionCards() {
    return [
      _buildMissionCard(
        icon: Icons.lightbulb_outline,
        title: 'Innovation',
        description: 'Foster innovative thinking and research excellence',
      ),
      _buildMissionCard(
        icon: Icons.people_outline,
        title: 'Leadership',
        description: 'Develop future leaders with global perspective',
      ),
      _buildMissionCard(
        icon: Icons.trending_up,
        title: 'Excellence',
        description: 'Maintain highest standards of academic excellence',
      ),
      _buildMissionCard(
        icon: Icons.public,
        title: 'Impact',
        description: 'Create positive impact on business and society',
      ),
    ];
  }

  Widget _buildMissionCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      height: 200, // Explicitly set container height
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Changed to start
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: 32, // Increased size back
            ),
          ),
          const SizedBox(height: 16), // Increased spacing
          Text(
            title,
            style: TextStyle(
              fontSize: 18, // Increased font size
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12), // Increased spacing
          Expanded(
            // Changed from Flexible to Expanded
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14, // Increased font size
                color: Colors.black87,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
              maxLines: 4, // Increased max lines
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Also update the GridView's childAspectRatio in _buildNarrowGridView()
  Widget _buildNarrowGridView() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.75, // Adjusted to accommodate the new height
      children: _buildMissionCards(),
    );
  }

  Widget _buildContentCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: primaryColor, size: 24),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
