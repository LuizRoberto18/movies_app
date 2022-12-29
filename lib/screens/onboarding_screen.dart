import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/custom_outline.dart';
import '../utils/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Constants.cBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.1,
              left: -88,
              child: Container(
                width: 186,
                height: 186,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.cPinkColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 186,
                    width: 186,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.3,
              right: -100,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.cGreenColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  CustomOutline(
                    strokeWidth: 4,
                    radius: screenWidth * 0.8,
                    padding: const EdgeInsets.all(4),
                    width: screenWidth * 0.8,
                    height: screenWidth * 0.8,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constants.cPinkColor,
                        Constants.cPinkColor.withOpacity(0),
                        Constants.cGreenColor.withOpacity(0.1),
                        Constants.cGreenColor,
                      ],
                      stops: const [
                        0.2,
                        0.4,
                        0.6,
                        1,
                      ],
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomLeft,
                          image: AssetImage("assets/images/img-onboarding.png"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.09,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
