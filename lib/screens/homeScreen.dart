import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movies_app/components/masked_image.dart';
import 'package:movies_app/components/search_field_widget.dart';
import 'package:movies_app/models/movies.dart';

import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.cBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.cGreenColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.4,
              right: -88,
              child: Container(
                height: 186,
                width: 186,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.cPinkColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaY: 200,
                    sigmaX: 200,
                  ),
                  child: Container(
                    height: 186,
                    width: 186,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    "O que você gostaria de assistir?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Constants.cWhiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SearchFieldWidget(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  const SizedBox(height: 39),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Novos filmes",
                      style: TextStyle(color: Constants.cWhiteColor, fontSize: 17),
                    ),
                  ),
                  const SizedBox(height: 37),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: newMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        if (index == 0) {
                          mask = Constants.cMaskFirstIndex;
                        } else if (index == newMovies.length - 1) {
                          mask = Constants.cMaskLastIndex;
                        } else {
                          mask = Constants.cMaskCenter;
                        }
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 5,
                            ),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                              asset: newMovies[index].moviePoster,
                              mask: mask,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 38),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Próximos filmes",
                      style: TextStyle(color: Constants.cWhiteColor, fontSize: 17),
                    ),
                  ),
                  const SizedBox(height: 37),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: upcomingMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        if (index == 0) {
                          mask = Constants.cMaskFirstIndex;
                        } else if (index == upcomingMovies.length - 1) {
                          mask = Constants.cMaskCenter;
                        } else {
                          mask = Constants.cMaskCenter;
                        }
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 5,
                            ),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                              asset: upcomingMovies[index].moviePoster,
                              mask: mask,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
            colors: [
              Constants.cPinkColor.withOpacity(0.2),
              Constants.cGreenColor.withOpacity(0.2),
            ],
          ),
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.cPinkColor,
                Constants.cGreenColor,
              ],
            ),
          ),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child: SvgPicture.asset(Constants.cIconPlus),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        width: screenWidth,
        height: 62,
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.cWhiteColor.withOpacity(0.1),
            Constants.cWhiteColor.withOpacity(0.1),
          ],
        ),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.cPinkColor,
            Constants.cGreenColor,
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          notchMargin: 4,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Constants.cIconHome),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Constants.cIconPlayOnTv),
                ),
              ),
              const Expanded(child: Text("")),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Constants.cIconCategories),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Constants.cIconDownload),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
