import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_likndin_website/core/Utils/responsive.dart';
import 'package:my_likndin_website/core/resources/colors.dart';
import 'package:my_likndin_website/core/resources/helpers/helpers.dart';
import 'package:my_likndin_website/reusable/label.dart';
import 'package:my_likndin_website/view/Screens/HomeScreen/widgets/about_us_section/widgets/contac_us.dart';
import 'package:my_likndin_website/view_model/Profile_bloc/profile_bloc.dart';
import 'package:my_likndin_website/view_model/Profile_bloc/profile_state.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final height = context.screenHeight;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;

    final headingSize = isMobile
        ? 30.0
        : isTablet
        ? 42.0
        : 56.0;

    final descriptionSize = isMobile
        ? 14.0
        : isTablet
        ? 16.0
        : 18.0;

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 40 : 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                padding: EdgeInsets.all(isMobile ? 20 : 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.12),
                      Colors.white.withOpacity(0.04),
                    ],
                  ),
                  border: Border.all(color: Colors.white.withOpacity(0.12)),
                  boxShadow: [
                    BoxShadow(
                      color: isHover
                          ? Colors.blue.withOpacity(0.25)
                          : Colors.black.withOpacity(0.15),
                      blurRadius: isHover ? 35 : 20,
                      spreadRadius: isHover ? 4 : 1,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: MouseRegion(
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
                  child: isMobile
                      ? Column(
                          children: [
                            /// IMAGE
                            _buildProfileImage(context, width, isMobile),

                            const SizedBox(height: 30),

                            /// TEXT
                            _buildTextSection(
                              headingSize,
                              descriptionSize,
                              context,
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// TEXT
                            Expanded(
                              flex: 3,
                              child: _buildTextSection(
                                headingSize,
                                descriptionSize,
                                context,
                              ),
                            ),

                            SizedBox(width: width * 0.04),

                            /// IMAGE
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: _buildProfileImage(
                                  context,
                                  width,
                                  isMobile,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection(
    double headingSize,
    double descriptionSize,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// SMALL LABEL
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.appYellowColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "WHO AM I",
            style: TextStyle(
              color: AppColors.appYellowColor,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              fontSize: descriptionSize * 0.8,
            ),
          ),
        ),

        const SizedBox(height: 25),

        /// HEADING
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Crafting Modern\n",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: headingSize,
                  fontWeight: FontWeight.w900,
                  height: 1.2,
                ),
              ),
              TextSpan(
                text: "Flutter Experiences",
                style: TextStyle(
                  color: AppColors.appYellowColor,
                  fontSize: headingSize,
                  fontWeight: FontWeight.w900,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        /// DESCRIPTION
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfieLoadedState) {
              return Text(
                state.aboutUs ?? '',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: descriptionSize,
                  height: 1.9,
                  fontWeight: FontWeight.w400,
                ),
              );
            }

            return const CircularProgressIndicator();
          },
        ),

        const SizedBox(height: 35),

        /// BUTTONS
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  AnimatedContainer(
                    // width: 150,
                    width: ScreenUtils.isDesktop(context) ? 150 : 130,
                    // height: 50,
                    height: ScreenUtils.isDesktop(context) ? 50 : 50,
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.appYellowColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: InkWell(
                      onTap: () {
                        Helpers.downloadCV();
                      },
                      child: const Text(
                        "Download CV",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  AnimatedContactLabel(
                    text: "Contact Us",
                    icon: Icons.support_agent,
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF6C63FF),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ContactUs()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context, double width, bool isMobile) {
    final imageSize = isMobile ? 220.0 : width * 0.22;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      height: imageSize,
      width: imageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.blue.withOpacity(0.5),
            Colors.purple.withOpacity(0.4),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.35),
            blurRadius: 40,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/profile.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
