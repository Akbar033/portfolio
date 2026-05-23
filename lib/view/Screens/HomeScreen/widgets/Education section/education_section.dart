import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_likndin_website/core/Utils/responsive.dart';
import 'package:my_likndin_website/core/constant/app_strings.dart';
import 'package:my_likndin_website/core/resources/colors.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({super.key});

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final height = context.screenHeight;

    final bool isMobile = width < 700;

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.08,
        horizontal: width * 0.06,
      ),

      child: Stack(
        children: [
          /// 🌌 BACKGROUND GLOW
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: width * 0.25,
              width: width * 0.25,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                gradient: RadialGradient(
                  colors: [Colors.blue.withOpacity(0.4), Colors.transparent],
                ),
              ),
            ),
          ),

          /// 🌌 SECOND GLOW
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: width * 0.3,
              width: width * 0.3,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                gradient: RadialGradient(
                  colors: [Colors.purple.withOpacity(0.3), Colors.transparent],
                ),
              ),
            ),
          ),

          /// ✨ MAIN CONTENT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE
              Text(
                "Education",

                style: TextStyle(
                  color: AppColors.appYellowColor,
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              SizedBox(height: height * 0.06),

              /// 🎓 EDUCATION CARD
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHover = true;
                  });
                },

                onExit: (_) {
                  setState(() {
                    isHover = false;
                  });
                },

                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 350),

                  width: double.infinity,

                  padding: EdgeInsets.all(isMobile ? 20 : 35),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,

                      colors: [
                        Colors.white.withOpacity(0.12),
                        Colors.white.withOpacity(0.04),
                      ],
                    ),

                    border: Border.all(color: Colors.white.withOpacity(0.1)),

                    boxShadow: [
                      BoxShadow(
                        color: isHover
                            ? AppColors.appYellowColor.withOpacity(0.25)
                            : Colors.black.withOpacity(0.2),

                        blurRadius: isHover ? 30 : 15,
                        spreadRadius: isHover ? 3 : 1,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),

                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          /// 🎓 UNIVERSITY + YEARS
                          isMobile
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    _universityTitle(isMobile),

                                    const SizedBox(height: 10),

                                    _yearBadge(isMobile),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(child: _universityTitle(isMobile)),

                                    _yearBadge(isMobile),
                                  ],
                                ),

                          SizedBox(height: height * 0.025),

                          /// 📍 LOCATION
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.blueAccent,
                                  size: isMobile ? 18 : 22,
                                ),

                                const SizedBox(width: 8),

                                Text(
                                  "Kohat University of Science and Technology",

                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: isMobile ? 13 : 16,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: height * 0.04),

                          /// 📝 DESCRIPTION
                          Text(
                            AppStrings.myEducation,

                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: isMobile ? 13 : 16,

                              height: 1.8,
                              letterSpacing: 0.4,
                            ),
                            textAlign: TextAlign.justify,
                          ),

                          SizedBox(height: height * 0.04),

                          /// 🛠 SKILLS TAGS
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,

                            children: [
                              _skillTag("Flutter"),
                              _skillTag("Firebase"),
                              _skillTag("REST APIs"),
                              _skillTag("UI/UX"),
                              _skillTag("Clean Architecture"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🎓 UNIVERSITY TITLE
  Widget _universityTitle(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          AppStrings.universityName,

          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 22 : 32,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          AppStrings.myDigree,

          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: isMobile ? 14 : 18,
          ),
        ),
      ],
    );
  }

  /// 📅 YEAR BADGE
  Widget _yearBadge(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14 : 20,
        vertical: isMobile ? 10 : 14,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),

        gradient: LinearGradient(
          colors: [
            Colors.blueAccent.withOpacity(0.7),
            Colors.purpleAccent.withOpacity(0.7),
          ],
        ),
      ),

      child: Text(
        AppStrings.universityDuration,

        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: isMobile ? 12 : 14,
        ),
      ),
    );
  }

  /// 🛠 SKILL TAG
  Widget _skillTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),

        color: Colors.white.withOpacity(0.08),

        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),

      child: Text(
        text,

        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
