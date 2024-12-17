import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize animations
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    // Start animation
    _controller.forward();

    // Navigate to home screen after delay
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(title: 'ISB'),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor.withOpacity(0.9),
              secondaryColor.withOpacity(0.9),
            ],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Logo
                        Image.asset(
                          'assets/icon.png',
                          fit: BoxFit.contain,
                        ),
                        
                        // Optional: Add a subtle shine effect
                        Positioned.fill(
                          child: ShineEffect(
                            color: cardColor.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Shine Effect Widget
class ShineEffect extends StatefulWidget {
  final Color color;

  const ShineEffect({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  State<ShineEffect> createState() => _ShineEffectState();
}

class _ShineEffectState extends State<ShineEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0 + (_controller.value * 2), 0),
              end: Alignment(-0.2 + (_controller.value * 2), 0),
              colors: [
                widget.color.withOpacity(0),
                widget.color.withOpacity(0.5),
                widget.color.withOpacity(0),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Optional: Loading Indicator
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(cardColor),
          strokeWidth: 3,
        ),
      ),
    );
  }
}

// Optional: Version Text
class VersionText extends StatelessWidget {
  final String version;

  const VersionText({
    super.key,
    required this.version,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: Text(
        'Version $version',
        style: TextStyle(
          color: cardColor.withOpacity(0.7),
          fontSize: 12,
        ),
      ),
    );
  }
}