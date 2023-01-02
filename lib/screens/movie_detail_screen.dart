import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/components/masked_image.dart';
import 'package:movies_app/utils/constants.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Color(0xFF19191B),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: screenHeight * 0.5,
                width: screenWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/posters/img-eternals.jpg'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.05,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: 44,
                        width: 44,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 3, color: Colors.white),
                        ),
                        child: SvgPicture.asset('assets/svg/icon-back.svg'),
                      ),
                    ),
                    Container(
                      height: 44,
                      width: 44,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 3, color: Colors.white),
                      ),
                      child: SvgPicture.asset('assets/svg/icon-menu.svg'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 9,
              top: screenHeight * 0.42,
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFE53BB),
                        Color(0xFF09FBD3),
                      ],
                    )),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.cGreyColor,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Constants.cWhiteColor,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.5,
                transform: Matrix4.translationValues(0, -screenHeight * 0.055, 0),
                child: Column(
                  children: [
                    Text(
                      "Eternos",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Constants.cWhiteColor.withOpacity(0.85),
                      ),
                    ),
                    SizedBox(height: screenHeight <= 667 ? 10 : 20),
                    Text(
                      "2021 • Ação-Aventura-Fantasia • 2h36m",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Constants.cWhiteColor.withOpacity(0.75),
                      ),
                    ),
                    const SizedBox(height: 20),
                    RatingBar.builder(
                      itemSize: 14,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) => const Icon(
                        Icons.start,
                        color: Constants.cYellowColor,
                      ),
                      onRatingUpdate: (rating) {
                        debugPrint(rating.toString());
                      },
                      unratedColor: Constants.cWhiteColor,
                    ),
                    Text(
                      "A saga dos Eternos, uma raça de\nimortais que viveu na Terra\ne moldou sua história e\ncivilizações.",
                      textAlign: TextAlign.center,
                      maxLines: screenHeight <= 667 ? 2 : 4,
                      style: TextStyle(
                        fontSize: 14,
                        color: Constants.cWhiteColor.withOpacity(0.75),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      height: 2,
                      width: screenWidth * 0.8,
                      color: Constants.cWhiteColor.withOpacity(0.15),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 23,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Elenco",
                                  style: TextStyle(
                                    color: Constants.cWhiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight <= 667 ? 10 : 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  minRadius: 16,
                                  maxRadius: screenWidth <= 375 ? 24 : 30,
                                  //maxRadius: 24,
                                  backgroundImage: const NetworkImage(
                                      'https://m.media-amazon.com/images/M/MV5BODg3MzYwMjE4N15BMl5BanBnXkFtZTcwMjU5NzAzNw@@._V1_.jpg'),
                                ),
                                Expanded(
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 112,
                                      maxHeight: 50,
                                    ),
                                    transform: Matrix4.translationValues(-6, 0, 0),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: const [
                                        MaskedImage(asset: Constants.cMaskCast, mask: Constants.cMaskCast),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Angelina\nJolie",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  minRadius: 16,
                                  maxRadius: screenWidth <= 375 ? 24 : 30,
                                  backgroundImage: const NetworkImage(
                                    'https://m.media-amazon.com/images/M/MV5BODg3MzYwMjE4N15BMl5BanBnXkFtZTcwMjU5NzAzNw@@._V1_.jpg',
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 112,
                                      maxHeight: 50,
                                    ),
                                    transform: Matrix4.translationValues(-6, 0, 0),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: const [
                                        MaskedImage(asset: Constants.cMaskCast, mask: Constants.cMaskCast),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Angelina\nJolie",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
