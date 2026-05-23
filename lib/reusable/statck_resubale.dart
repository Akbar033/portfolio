import 'package:flutter/material.dart';
import 'package:my_likndin_website/core/Utils/responsive.dart';
import 'package:my_likndin_website/core/resources/app_fontsize.dart';
import 'package:my_likndin_website/core/resources/colors.dart';

// ignore: must_be_immutable
class StatckResubale extends StatelessWidget {
  String? headingText;
  final String experience;
  final String softwareHouse;
  final Color textColor;
  final String imagePath;
  StatckResubale({
    super.key,
    this.headingText,
    required this.experience,
    required this.textColor,
    required this.imagePath,
    required this.softwareHouse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
      height: context.screenHeight * 0.6,
      width: context.screenWidth * 1,
      child: Stack(
        children: [
          Positioned(
            right: 20,
            child: Container(
              height: context.screenHeight * 0.25,
              width: context.screenWidth * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryColor,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),

          Container(
            color: AppColors.secondaryColor,
            height: context.screenHeight * 0.6,
            width: context.screenWidth * 0.6,

            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headingText ?? '',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: AppColors.appYellowColor,
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontsize.headingFont,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        experience,
                        style: TextStyle(
                          fontFamily: 'Cardo',
                          color: AppColors.whiteTextColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
