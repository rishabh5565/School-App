import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

// Use the same theme colors as defined earlier
const Color primaryColor = Color(0xFF6B5B95);
const Color secondaryColor = Color(0xFF4682B4);
const Color backgroundColor = Color(0xFFF0F2F5);
const Color cardColor = Colors.white;

class ContactPage extends StatelessWidget {
  ContactPage({super.key});
  // Use the same theme colors as defined earlier
  final Color backgroundColor = Color(0xFFF0F2F5);
  final Color cardColor = Colors.white;

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
        "Contact Us",
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
              children: [_buildMainContent()],
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

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Get in Touch'),
        const SizedBox(height: 20),
        _buildContactFormCard(),
        const SizedBox(height: 30),
        _buildSectionTitle('Connect With Us'),
        const SizedBox(height: 20),
        _buildSocialMediaLinks(),
      ],
    );
  }

  Widget _buildSocialMediaLinks() {
    final socialLinks = [
      {
        'name': 'Facebook',
        'icon': Icons.facebook,
        'color': const Color(0xFF1877F2),
        'url': 'https://www.facebook.com/ISBedu/',
      },
      {
        'name': 'Twitter',
        'icon': Icons.flutter_dash,
        'color': const Color(0xFF1DA1F2),
        'url': 'https://x.com/ISBedu',
      },
      {
        'name': 'Instagram',
        'icon': Icons.camera_alt,
        'color': const Color(0xFFE4405F),
        'url': 'https://www.instagram.com/isbindia/',
      },
      {
        'name': 'YouTube',
        'icon': Icons.play_circle_filled,
        'color': const Color(0xFFFF0000),
        'url': 'https://www.youtube.com/user/isbindia',
      },
      {
        'name': 'Blog',
        'icon': Icons.article,
        'color': const Color(0xFF292929),
        'url': 'https://blogs.isb.edu/',
      },
      {
        'name': 'RSS Feed',
        'icon': Icons.rss_feed,
        'color': const Color(0xFFFF6600),
        'url': 'https://www.isb.edu/en/rss.html',
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: socialLinks.length,
            itemBuilder: (context, index) {
              final link = socialLinks[index];
              return _buildSocialMediaButton(
                icon: link['icon'] as IconData,
                name: link['name'] as String,
                color: link['color'] as Color,
                onTap: () {
                  // Handle social media link tap
                  // You can add URL launcher here
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaButton({
    required IconData icon,
    required String name,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.3), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildContactFormCard() {
    return Builder(
      builder: (context) {
        final formKey = GlobalKey<FormState>();
        String name = '';
        String contact = '';
        String email = '';
        String message = '';

        return Container(
          decoration: BoxDecoration(
            color: cardColor, // Using cardColor instead of Colors.white
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(
                  0.1,
                ), // Using primaryColor for shadow
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
            // Optional: Add a subtle border
            border: Border.all(color: primaryColor.withOpacity(0.1), width: 1),
          ),
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField(
                  label: 'Name',
                  onChanged: (value) => name = value,
                  validator:
                      (value) =>
                          value?.isEmpty ?? true
                              ? 'Please enter your name'
                              : null,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Contact Number',
                  onChanged: (value) => contact = value,
                  validator:
                      (value) =>
                          value?.isEmpty ?? true
                              ? 'Please enter your contact'
                              : null,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Email',
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Message',
                  onChanged: (value) => message = value,
                  validator:
                      (value) =>
                          value?.isEmpty ?? true
                              ? 'Please enter your message'
                              : null,
                  maxLines: 4,
                ),
                const SizedBox(height: 30),
                _buildSubmitButton(context, formKey),
              ],
            ),
          ),
        );
      },
    );
  }


  // Add this to your theme or at the top of your file
  final InputDecorationTheme formTheme = InputDecorationTheme(
    errorStyle: TextStyle(
      color: primaryColor, // Using primaryColor for error messages
      fontSize: 12,
    ),
    helperStyle: TextStyle(color: primaryColor.withOpacity(0.7), fontSize: 12),
  );

  // Optional: Add hover effect
  Widget _buildHoverableFormCard(Widget child) {
    return MouseRegion(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: child,
      ),
    );
  }

  // Optional: Add loading state to submit button
  Widget _buildSubmitButtonWithLoading(
    BuildContext context,
    GlobalKey<FormState> formKey,
    bool isLoading,
  ) {
    return ElevatedButton(
      onPressed:
          isLoading
              ? null
              : () {
                if (formKey.currentState!.validate()) {
                  // Handle form submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Message sent successfully!'),
                      backgroundColor: primaryColor,
                    ),
                  );
                }
              },
      style: ElevatedButton.styleFrom(
        foregroundColor: cardColor,
        backgroundColor: primaryColor,
        disabledBackgroundColor: primaryColor.withOpacity(0.6),
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
      ),
      child:
          isLoading
              ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(cardColor),
                  strokeWidth: 2,
                ),
              )
              : const Text(
                'Submit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: primaryColor.withOpacity(0.8)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: primaryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: primaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: secondaryColor, width: 2),
        ),
        filled: true,
        fillColor: backgroundColor,
      ),
      style: TextStyle(color: primaryColor),
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Message sent successfully!'),
              backgroundColor: primaryColor,
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: cardColor,
        backgroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
      ),
      child: const Text(
        'Submit',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDetailsCard() {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
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
          _buildContactDetail(
            icon: Icons.location_on,
            title: 'Address',
            content: 'Ansari Nagar, New Delhi - 110029',
          ),
          const SizedBox(height: 20),
          _buildContactDetail(
            icon: Icons.phone,
            title: 'Phone',
            content: '+91-11-26588500 / 26588700',
          ),
          const SizedBox(height: 20),
          _buildContactDetail(
            icon: Icons.email,
            title: 'Email',
            content: 'aiims.reg@gmail.com',
          ),
        ],
      ),
    );
  }

  Widget _buildContactDetail({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: primaryColor, size: 24),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  color: primaryColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
