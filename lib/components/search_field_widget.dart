import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const SearchFieldWidget({Key? key, required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          color: Constants.cGreyColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            SvgPicture.asset(
              Constants.cIconSearch,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: Constants.cWhiteColor.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.41,
                ),
                decoration: InputDecoration(
                  helperText: 'Search',
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle:
                      TextStyle(color: Constants.cWhiteColor.withOpacity(0.6), fontSize: 17, letterSpacing: -0.41),
                ),
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(Constants.cIconMic),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
