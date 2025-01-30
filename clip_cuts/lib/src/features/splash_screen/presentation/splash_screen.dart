import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/img_splash_screen_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Blue overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.8),
                    Colors.teal.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Top-left ellipse
          Positioned(
            top: -MediaQuery.of(context).size.height * 0.0001,
            left: -MediaQuery.of(context).size.width * 0.0001,
            child: SvgPicture.asset(
              'assets/svg/svg_splash_screen_top_ellipse.svg',
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.white,
            ),
          ),
          // Bottom-right ellipse
          Positioned(
            bottom: -MediaQuery.of(context).size.height * 0.075,
            right: -MediaQuery.of(context).size.width * 0.1,
            child: SvgPicture.asset(
              'assets/svg/svg_splash_screen_bottom_ellipse.svg',
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.white,
            ),
          ),
          // Centered logo
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/img_splash_screen_icon.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  "ClipCuts",
                  style: TextStyle(
                    color: const Color(0xffffffff),
                    fontSize: MediaQuery.of(context).size.height * 0.06,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pattaya',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
